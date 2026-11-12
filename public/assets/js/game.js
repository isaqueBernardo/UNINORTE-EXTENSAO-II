/*
 * ROTA TECH / AVENTURA ORIGINAL EM CANVAS
 * Controles: setas/A,D, espaco/W/cima; botoes touch em mobile.
 * Aventura de plataforma apenas controla navegacao. Escolhas e pontuacoes sao
 * validadas exclusivamente pelo Laravel na rota POST /aventura/responder.
 */
(() => {
  'use strict';
  const canvas = document.getElementById('career-game');
  const shell = document.getElementById('game-shell');
  if (!canvas || !shell) return;
  const ctx = canvas.getContext('2d');
  if (!ctx) return;
  const modal = document.getElementById('mission-modal');
  const optionsHolder = document.getElementById('mission-options');
  const title = document.getElementById('mission-title');
  const scenario = document.getElementById('mission-scenario');
  const errorBox = document.getElementById('mission-error');
  const progressLabel = document.getElementById('game-progress-label');
  const progressBar = document.getElementById('game-progress-bar');
  const toast = document.getElementById('game-toast');
  const gameStatus = document.getElementById('game-status');
  const soundButton = document.getElementById('game-sound-toggle');
  const controlButtons = [...document.querySelectorAll('[data-control]')];
  const curtain = document.getElementById('transition-curtain');
  const CSRF = document.querySelector('meta[name="csrf-token"]')?.content || '';
  const W = canvas.width, H = canvas.height, FLOOR = 405, STEP = 860;
  // Cada tecla ou ponteiro tem seu proprio estado: segurar esquerda e direita
  // simultaneamente nao provoca teclas travadas ao soltar um deles.
  const keys = { left: false, right: false, jump: false };
  const activeInputs = new Map();
  let jumpConsumed = false;
  function setInput(control, source, active) {
    if (!['left','right','jump'].includes(control)) return;
    const sources = activeInputs.get(control) || new Set();
    if (active) sources.add(source);
    else sources.delete(source);
    activeInputs.set(control, sources);
    keys[control] = sources.size > 0;
    if (control === 'jump' && !keys.jump) jumpConsumed = false;
    controlButtons.forEach(btn => {
      if (btn.dataset.control === control) btn.classList.toggle('is-pressed', keys[control]);
    });
  }
  function releaseInputs() {
    activeInputs.clear();
    keys.left = keys.right = keys.jump = false;
    jumpConsumed = false;
    controlButtons.forEach(btn => btn.classList.remove('is-pressed'));
  }

  // Trilha sonora ORIGINAL gerada no proprio navegador com Web Audio.
  // Nao necessita de MP3, downloads ou bibliotecas de terceiros.
  // Navegadores bloqueiam audio automatico: a primeira interacao com o jogo
  // ou o botao 'Ativar musica' inicia a musica com permissao do navegador.
  let audioContext = null;
  let musicInterval = null;
  let musicIndex = 0;
  let musicEnabled = false;
  let manuallyMuted = false;
  const melody = [
    523.25, 659.25, 783.99, 659.25, 587.33, 659.25, 698.46, 783.99,
    880.00, 783.99, 659.25, 587.33, 523.25, 0, 392.00, 493.88,
    523.25, 659.25, 783.99, 1046.50, 987.77, 783.99, 659.25, 587.33,
    698.46, 659.25, 587.33, 523.25, 392.00, 0, 523.25, 0
  ];
  const bass = [130.81, 146.83, 174.61, 196.00];
  function refreshSoundLabel() {
    if (!soundButton) return;
    soundButton.textContent = musicEnabled ? '♫ Música ligada' : '♫ Ativar música';
    soundButton.setAttribute('aria-pressed', String(musicEnabled));
    soundButton.title = musicEnabled ? 'Desligar trilha sonora' : 'Ligar trilha sonora';
  }
  function note(frequency, duration = 0.16, volume = 0.028, wave = 'square') {
    if (!musicEnabled || !audioContext || !frequency || audioContext.state !== 'running') return;
    try {
      const now = audioContext.currentTime;
      const osc = audioContext.createOscillator();
      const gain = audioContext.createGain();
      osc.type = wave;
      osc.frequency.setValueAtTime(frequency, now);
      gain.gain.setValueAtTime(0.0001, now);
      gain.gain.exponentialRampToValueAtTime(volume, now + 0.012);
      gain.gain.exponentialRampToValueAtTime(0.0001, now + duration);
      osc.connect(gain); gain.connect(audioContext.destination);
      osc.start(now); osc.stop(now + duration + 0.015);
    } catch (error) { console.warn('Audio indisponivel:', error); }
  }
  function soundEffect(type) {
    if (!musicEnabled) return;
    if (type === 'jump') { note(698.46, 0.10, 0.021, 'triangle'); }
    else if (type === 'coin') { note(1174.66, 0.11, 0.025); }
    else if (type === 'portal') { note(523.25, 0.24, 0.036, 'sine'); note(783.99, 0.23, 0.022); }
    else if (type === 'hit') { note(164.81, 0.14, 0.022, 'sawtooth'); }
    else if (type === 'answer') { note(880, 0.16, 0.023, 'triangle'); }
    else if (type === 'finish') { note(1046.5, 0.38, 0.036, 'triangle'); }
  }
  function musicBeat() {
    if (!musicEnabled || !audioContext || document.hidden) return;
    note(melody[musicIndex % melody.length], 0.17, 0.013, 'square');
    if (musicIndex % 4 === 0) note(bass[Math.floor(musicIndex / 8) % bass.length], 0.32, 0.016, 'triangle');
    musicIndex++;
  }
  async function enableMusic() {
    const Context = window.AudioContext || window.webkitAudioContext;
    if (!Context) { showToast('O navegador nao oferece suporte a audio.'); return; }
    try {
      if (!audioContext) audioContext = new Context();
      musicEnabled = true;
      manuallyMuted = false;
      refreshSoundLabel();
      await audioContext.resume();
      if (musicEnabled && !musicInterval) {
        musicBeat();
        musicInterval = window.setInterval(musicBeat, 235);
      }
    } catch (error) {
      musicEnabled = false;
      refreshSoundLabel();
      showToast('Nao foi possivel iniciar o som neste navegador.');
      console.error('Rota Tech: erro de audio', error);
    }
  }
  function disableMusic() {
    musicEnabled = false;
    manuallyMuted = true;
    if (musicInterval) window.clearInterval(musicInterval);
    musicInterval = null;
    if (audioContext && audioContext.state === 'running') audioContext.suspend().catch(() => {});
    refreshSoundLabel();
  }
  function onPlayerGesture() {
    if (!musicEnabled && !manuallyMuted) enableMusic();
    else if (musicEnabled && audioContext?.state === 'suspended') audioContext.resume().catch(() => {});
  }
  soundButton?.addEventListener('click', () => {
    if (musicEnabled) disableMusic();
    else enableMusic();
  });
  refreshSoundLabel();
  const coins = new Set();
  const stars = Array.from({length: 19}, (_, i) => ({ x: (i * 251 + 43) % W, y: 15 + ((i * 61) % 125), size: i % 3 === 0 ? 3 : 2 }));
  let state = window.ROTA_GAME || { answered: 0, total: 0, question: null, finished: false };
  let cameraX = 0, frame = 0, paused = false, waiting = false;
  let runParticles = [];
  const player = {
    x: state.answered * STEP + 56, y: FLOOR - 55,
    w: 36, h: 55, vx: 0, vy: 0, grounded: true,
    face: 1, animation: 0, invulnerability: 0
  };

  const clamp = (n, a, b) => Math.max(a, Math.min(b, n));
  function checkpointX(index) { return index * STEP + 705; }
  function resetPlayer() {
    player.x = state.answered * STEP + 55;
    player.y = FLOOR - player.h;
    player.vx = 0; player.vy = 0;
    player.grounded = true;
    player.invulnerability = 65;
    soundEffect('hit');
    showToast('Ops! Respawn no checkpoint. Tente outro salto!');
  }
  function showToast(message) {
    if (!toast) return;
    toast.textContent = message;
    toast.style.opacity = 1;
  }
  function rnd(seed) { const val = Math.sin(seed * 12.9898) * 43758.5453; return val - Math.floor(val); }
  function screenX(x, parallax = 1) { return x - cameraX * parallax; }
  function rounded(x, y, w, h, radius, fill) {
    ctx.beginPath();
    if (typeof ctx.roundRect === 'function') ctx.roundRect(x, y, w, h, radius);
    else ctx.rect(x, y, w, h); // Compatibilidade com navegadores mais antigos.
    ctx.fillStyle = fill; ctx.fill();
  }

  function update() {
    frame++;
    if (paused || waiting || state.finished || !state.question) return;
    const prevFoot = player.y + player.h;
    const horizontal = (keys.right ? 1 : 0) - (keys.left ? 1 : 0);
    const moveSpeed = 5.1;
    player.vx += (horizontal * moveSpeed - player.vx) * (horizontal ? .25 : .17);
    if (horizontal) player.face = horizontal;
    player.x = Math.max(15, player.x + player.vx);
    if (keys.jump && player.grounded && !jumpConsumed) {
      jumpConsumed = true;
      soundEffect('jump');
      player.vy = -14.6; player.grounded = false;
      for (let i = 0; i < 5; i++) runParticles.push({x:player.x+18, y:FLOOR, vx:(Math.random()-.5)*4,vy:-Math.random()*3-1,life:22});
    }
    player.vy = Math.min(16, player.vy + .77);
    player.y += player.vy;
    player.grounded = false;
    if (player.y + player.h >= FLOOR) {
      player.y = FLOOR - player.h;
      player.vy = 0; player.grounded = true;
    }
    // Plataformas elevadas servem como desafios opcionais.
    const first = Math.floor(player.x / STEP) - 1;
    for (let i = Math.max(0, first); i <= first + 3; i++) {
      for (let n = 0; n < 2; n++) {
        const px = i * STEP + 235 + n * 180;
        const py = n === 0 ? 301 : 252;
        if (player.vy >= 0 && prevFoot <= py + 7 && player.y + player.h >= py && player.x + player.w > px && player.x < px + 118) {
          player.y = py - player.h; player.vy = 0; player.grounded = true;
        }
      }
    }
    if (horizontal && player.grounded && frame % 7 === 0) runParticles.push({x:player.x+18, y:FLOOR-3, vx:-horizontal*(1+Math.random()*2),vy:-1.5,life:17});
    player.animation += horizontal ? .2 : .06;
    player.invulnerability = Math.max(0, player.invulnerability - 1);
    for (const particle of runParticles) { particle.x += particle.vx;particle.y += particle.vy;particle.vy += .18;particle.life--; }
    runParticles = runParticles.filter(p => p.life > 0).slice(-60);
    cameraX += (Math.max(0, player.x - W * .28) - cameraX) * .12;
    const index = state.answered;
    // Obstaculo simples e amistoso: tocar nele apenas reinicia no checkpoint.
    const spikeX = index * STEP + 410;
    if (!player.invulnerability && player.x + player.w > spikeX + 4 && player.x < spikeX + 52 && player.y + player.h > FLOOR - 31) {
      resetPlayer(); return;
    }
    const portalX = checkpointX(index);
    if (Math.abs(player.x + player.w / 2 - portalX) < 46 && player.y + player.h >= FLOOR - 110) openQuestion();
    // A tecla nao precisa ser liberada quando o jogador chega ao portal.
    if (frame % 110 === 0) showToast(`Encontre o portal ${index + 1} de ${state.total}. Corra, salte e descubra!`);
  }

  function drawCloud(x, y, scale, opacity) {
    ctx.save(); ctx.globalAlpha = opacity; ctx.fillStyle = '#ffffff';
    ctx.beginPath(); ctx.ellipse(x, y, 56*scale, 18*scale, 0, 0, Math.PI*2); ctx.fill();
    ctx.beginPath();ctx.arc(x-19*scale,y-13*scale,23*scale,0,Math.PI*2);ctx.arc(x+18*scale,y-18*scale,29*scale,0,Math.PI*2);ctx.fill();
    ctx.restore();
  }
  function drawBackdrop() {
    const gradient = ctx.createLinearGradient(0,0,0,FLOOR);
    gradient.addColorStop(0,'#73b5dc'); gradient.addColorStop(.75,'#caf0e8'); gradient.addColorStop(1,'#c4ebcb');
    ctx.fillStyle = gradient; ctx.fillRect(0,0,W,H);
    ctx.save(); ctx.globalAlpha=.2; ctx.fillStyle='#fffbd7'; ctx.beginPath();ctx.arc(W-168,89,56,0,Math.PI*2);ctx.fill();ctx.restore();
    stars.forEach(s => { ctx.globalAlpha = .6+.3*Math.sin(frame*.018+s.x);ctx.fillStyle='#fff';ctx.fillRect(s.x, s.y, s.size, s.size); });ctx.globalAlpha=1;
    const cloudOffset = (cameraX * .16) % 340;
    for(let n=-2;n<8;n++) drawCloud(n*300-cloudOffset+55,58+(n%3)*45, .65+(n%3)*.15, .65);
    // Montanhas e colinas em paralaxe.
    for(let n=-2;n<7;n++) {
      const x=n*320-(cameraX*.22%320);
      ctx.fillStyle=n%2?'#83bfaf':'#96cab6';
      ctx.beginPath();ctx.moveTo(x-160,FLOOR);ctx.lineTo(x+80,170);ctx.lineTo(x+320,FLOOR);ctx.closePath();ctx.fill();
    }
    for(let n=-2;n<12;n++) {
      const x=n*195-(cameraX*.4%195);const y=356+Math.sin(n)*18;
      ctx.fillStyle='#75b999';ctx.beginPath();ctx.ellipse(x,y,145,90,0,0,Math.PI*2);ctx.fill();
    }
  }
  function drawWorld() {
    const segmentStart = Math.max(0, Math.floor(cameraX/STEP)-1);
    const segmentEnd = Math.min(state.total+1,segmentStart+4);
    for(let idx=segmentStart;idx<=segmentEnd;idx++){
      const origin = screenX(idx*STEP);
      // Arvores com folhas geometricas.
      for(let n=0;n<4;n++){
        const tx=origin+70+n*216;
        rounded(tx-5,FLOOR-75,12,75,3,'#826a51');
        for(let k=0;k<3;k++){
          ctx.fillStyle=['#348c76','#3e9a74','#55b17d'][k];
          ctx.beginPath();ctx.arc(tx+(k-1)*13,FLOOR-85-k*17,25,0,Math.PI*2);ctx.fill();
        }
      }
      // Nuvem-plataformas que podem ser escaladas.
      for(let n=0;n<2;n++){
        const px=origin+235+n*180,py=n===0?301:252;
        rounded(px,py,118,15,4,'#37785a'); rounded(px,py,118,9,4,'#69d273');
        for(let j=0;j<4;j++){ctx.fillStyle='#c3f6ba';ctx.fillRect(px+11+j*27,py+2,9,3)}
      }
      // Cristais/objetos de exploracao.
      for(let n=0;n<4;n++){
        const x=origin+235+n*73, y= n%2?210:253, key=`${idx}:${n}`;
        if(!coins.has(key) && x > -30 && x<W+30){
          ctx.save();ctx.translate(x,y+Math.sin(frame*.055+n)*5);ctx.rotate(Math.PI/4);ctx.fillStyle='#ffdf65';ctx.shadowColor='#ffcf32';ctx.shadowBlur=13;ctx.fillRect(-9,-9,18,18);ctx.restore();
          const worldCoinX = idx * STEP + 235 + n * 73;
          if (Math.abs(player.x + player.w / 2 - worldCoinX) < 23 && Math.abs(player.y + 20 - y) < 35) {
            coins.add(key); soundEffect('coin'); showToast('Cristal de curiosidade coletado! ✦');
          }
        }
      }
      // Obstaculos educativos.
      const spike=origin+410;
      for(let a=0;a<3;a++){ctx.beginPath();ctx.moveTo(spike+a*19,FLOOR);ctx.lineTo(spike+10+a*19,FLOOR-32);ctx.lineTo(spike+19+a*19,FLOOR);ctx.closePath();ctx.fillStyle='#f58e6b';ctx.fill();ctx.strokeStyle='#dd6e54';ctx.stroke()}
      // Entrada de cada checkpoint.
      if(idx < state.total) drawPortal(screenX(checkpointX(idx)),FLOOR);
    }
    // Chao continuo e detalhes.
    ctx.fillStyle='#78c86c';ctx.fillRect(0,FLOOR,W,17);
    ctx.fillStyle='#388a6a';ctx.fillRect(0,FLOOR+17,W,H-FLOOR-17);
    const offset=(cameraX%34+34)%34;
    for(let i=-1;i<W/34+2;i++){
      ctx.fillStyle=i%2?'#57a970':'#408e69';ctx.fillRect(i*34-offset,FLOOR+22,18,5);
      ctx.fillStyle='#80d179';ctx.fillRect(i*34-offset+8,FLOOR+4,7,4);
    }
  }
  function drawPortal(x, floor) {
    const glow=.5+.5*Math.sin(frame*.045);
    ctx.save();ctx.shadowColor='#9b69f9';ctx.shadowBlur=24+glow*17;
    rounded(x-38,floor-109,76,108,[38,38,5,5],'#ffed9c');
    ctx.shadowBlur=0; rounded(x-29,floor-100,58,99,[28,28,3,3],'#7c5ec5');
    const gradient=ctx.createLinearGradient(x, floor-100,x,floor);
    gradient.addColorStop(0,'#ceabff');gradient.addColorStop(1,'#7644bc');
    rounded(x-24,floor-95,48,90,[25,25,2,2],gradient);
    ctx.fillStyle='#f9eac1';ctx.font='bold 43px Outfit, sans-serif';ctx.textAlign='center';ctx.fillText('?',x,floor-33);
    ctx.font='bold 12px DM Sans, sans-serif';ctx.fillStyle='#163955';ctx.fillText('PORTAL '+(state.answered+1),x,floor-124);
    for(let i=0;i<5;i++){const a=(i/5)*Math.PI*2+frame*.025;ctx.fillStyle='#fff6af';ctx.fillRect(x+Math.cos(a)*55,floor-56+Math.sin(a)*70,4,4)}
    ctx.restore();
  }
  function drawPlayer() {
    const x=screenX(player.x), y=player.y;
    ctx.save();ctx.translate(x+18,y+27);ctx.scale(player.face,1);ctx.translate(-18,-27);
    if(player.invulnerability && frame%8<4)ctx.globalAlpha=.5;
    // Sombra, calcas e tenis.
    ctx.fillStyle='#27517c';ctx.fillRect(8,40,9,12);ctx.fillRect(20,40,9,12);
    ctx.fillStyle='#112c4c';ctx.fillRect(5,49,14,7);ctx.fillRect(20,49,14,7);
    // Mochila de aventureiro.
    rounded(0,22,11,21,4,'#f4bb6a');
    rounded(8,25,23,20,5,'#51ba42');
    rounded(27,27,8,7,4,'#fed1ab');
    // Cabeca e cabelo.
    rounded(7,2,23,25,8,'#f9c69d');
    rounded(5,0,27,9,5,'#1b3d63');
    ctx.fillStyle='#15384c';ctx.fillRect(22,13,3,3);ctx.fillRect(14,13,3,3);
    ctx.strokeStyle='#ce8a73';ctx.lineWidth=1.5;ctx.beginPath();ctx.arc(20,16,4,.1,Math.PI-.1);ctx.stroke();
    // Bone/orelha e fone de tecnologia.
    ctx.fillStyle='#204d86';ctx.fillRect(8,5,23,4);ctx.fillRect(26,8,10,4);
    ctx.restore();
    runParticles.forEach(p=>{ctx.save();ctx.globalAlpha=Math.max(0,p.life/22);ctx.fillStyle='#f5f6c0';ctx.fillRect(screenX(p.x),p.y,4,4);ctx.restore()});
  }
  function drawHUD() {
    rounded(18,16,215,49,13,'#123657d8');
    ctx.fillStyle='#f3fffc';ctx.font='800 13px DM Sans, sans-serif';ctx.textAlign='left';ctx.fillText('EXPLORADOR • NIVEL 01',35,36);
    ctx.fillStyle='#a6dbc4';ctx.font='11px DM Sans, sans-serif';ctx.fillText(`${state.answered} de ${state.total} portais descobertos`,35,54);
    rounded(W-187,18,170,45,12,'#133b55c7');
    ctx.fillStyle='#ffdb63';ctx.font='bold 20px DM Sans, sans-serif';ctx.fillText('✦ '+coins.size,W-167,48);
    ctx.fillStyle='#d7f5eb';ctx.font='11px DM Sans, sans-serif';ctx.fillText('cristais',W-100,45);
  }
  function render() {
    try {
      update();
      drawBackdrop(); drawWorld(); drawPlayer(); drawHUD();
      requestAnimationFrame(render);
    } catch (error) {
      console.error('Rota Tech: erro ao desenhar o jogo', error);
      if (gameStatus) gameStatus.textContent = 'ERRO AO INICIAR O JOGO';
      showToast('Falha no jogo. Pressione F12 e abra o Console para detalhes.');
    }
  }

  function openQuestion() {
    if(paused || waiting || !state.question || state.finished)return;
    if (!modal || !title || !scenario || !optionsHolder || !errorBox) return;
    paused=true;
    releaseInputs();
    soundEffect('portal');
    title.textContent=state.question.title;
    scenario.textContent=state.question.scenario;
    document.getElementById('mission-count').textContent=`PORTAL ${String(state.answered+1).padStart(2,'0')} / ${state.total}`;
    errorBox.hidden=true;
    optionsHolder.replaceChildren();
    state.question.options.forEach((option, i)=>{
      const btn=document.createElement('button');btn.type='button';btn.className='mission-option';
      const letter=document.createElement('b');letter.textContent=String.fromCharCode(65+i);
      const text=document.createElement('span');text.textContent=option.label;
      btn.append(letter,text);btn.addEventListener('click',()=>submitAnswer(option.id));
      optionsHolder.appendChild(btn);
    });
    modal.hidden=false;
    document.body.style.overflow='hidden';
    optionsHolder.querySelector('button')?.focus();
  }
  async function submitAnswer(answerId) {
    if(waiting)return;
    waiting=true;errorBox.hidden=true;
    optionsHolder.querySelectorAll('button').forEach(btn=>btn.disabled=true);
    try {
      const response=await fetch(shell.dataset.routeAnswer,{
        method:'POST',credentials:'same-origin',headers:{'Content-Type':'application/json','Accept':'application/json','X-CSRF-TOKEN':CSRF},
        body:JSON.stringify({attempt_id:state.attempt_id,question_id:state.question.id,answer_id:answerId})
      });
      const json=await response.json();
      if(!response.ok)throw new Error(json.message || Object.values(json.errors || {})[0]?.[0] || 'Nao foi possivel salvar sua escolha.');
      state=json;modal.hidden=true;document.body.style.overflow='';canvas.focus({preventScroll:true});
      soundEffect('answer');
      progressLabel.textContent=`DESAFIO ${Math.min(state.answered+1,state.total)} / ${state.total}`;
      progressBar.style.width=`${state.total ? state.answered/state.total*100 : 0}%`;
      paused=false;
      if(json.feedback)showToast(json.feedback);
      if(state.finished){finishGame();return;}
      player.x=state.answered*STEP+55;player.vx=0;player.vy=0;player.y=FLOOR-player.h;player.invulnerability=50;
    }catch(error){
      errorBox.hidden=false;errorBox.textContent=error.message;
      optionsHolder.querySelectorAll('button').forEach(btn=>btn.disabled=false);
    }finally{waiting=false;}
  }
  function finishGame(){
    paused=true;
    soundEffect('finish');
    if(!curtain || !state.result_url){return;}
    curtain.hidden=false;
    window.setTimeout(()=>curtain.classList.add('is-opening'),1400);
    window.setTimeout(()=>{window.location.assign(state.result_url + '#suas-trilhas');},2650);
  }
  function keyToControl(key) {
    if (['ArrowLeft', 'a', 'A'].includes(key)) return 'left';
    if (['ArrowRight', 'd', 'D'].includes(key)) return 'right';
    if (['ArrowUp', ' ', 'Spacebar', 'w', 'W'].includes(key)) return 'jump';
    return null;
  }
  function isTyping(target) {
    return target instanceof HTMLElement &&
      (['INPUT','TEXTAREA','SELECT'].includes(target.tagName) || target.isContentEditable);
  }
  // Teclado funciona em toda a pagina do jogo, mesmo depois que o usuario
  // clicou em um botao do painel. Controles desativados durante as perguntas.
  window.addEventListener('keydown', event => {
    const control = keyToControl(event.key);
    if (!control || isTyping(event.target) || paused || waiting || state.finished) return;
    if ((event.key === ' ' || event.key === 'Spacebar') && event.target instanceof HTMLElement && event.target.closest('button:not([data-control])')) return;
    if (modal && !modal.hidden) return;
    event.preventDefault();
    setInput(control, 'keyboard:' + event.key, true);
    if (!event.repeat) onPlayerGesture();
  });
  window.addEventListener('keyup', event => {
    const control = keyToControl(event.key);
    if (!control) return;
    setInput(control, 'keyboard:' + event.key, false);
  });
  window.addEventListener('blur', releaseInputs);
  document.addEventListener('visibilitychange', () => { if (document.hidden) releaseInputs(); });

  // Botoes sempre visiveis, inclusive no Windows. Compatibilidade com mouse,
  // touchscreen, caneta e controles acionados por acessibilidade.
  controlButtons.forEach(btn => {
    const control = btn.dataset.control;
    const source = 'pointer:' + control;
    btn.addEventListener('pointerdown', event => {
      if (paused || waiting || state.finished) return;
      event.preventDefault();
      try { btn.setPointerCapture(event.pointerId); } catch (_) {}
      setInput(control, source + ':' + event.pointerId, true);
      onPlayerGesture();
    });
    const release = event => {
      event.preventDefault();
      setInput(control, source + ':' + event.pointerId, false);
    };
    btn.addEventListener('pointerup', release);
    btn.addEventListener('pointercancel', release);
    btn.addEventListener('lostpointercapture', release);
    btn.addEventListener('contextmenu', event => event.preventDefault());
    // Acionamento de botao via Enter / Espaco (acessibilidade).
    btn.addEventListener('click', event => {
      if (event.detail !== 0 || paused || waiting || state.finished) return;
      const keyboardSource = 'button:' + control;
      setInput(control, keyboardSource, true);
      onPlayerGesture();
      window.setTimeout(() => setInput(control, keyboardSource, false), 180);
    });
  });
  canvas.addEventListener('pointerdown', () => { canvas.focus({ preventScroll: true }); onPlayerGesture(); });
  document.getElementById('accessible-question')?.addEventListener('click', openQuestion);

  if (state.finished && state.result_url) { window.location.replace(state.result_url); return; }
  if (gameStatus) gameStatus.textContent = state.question && state.total ? 'PRONTO PARA JOGAR' : 'SEM MISSOES DISPONIVEIS';
  if (!state.question || !state.total) showToast('Este mundo aguarda desafios. Solicite ao professor que configure o jogo.');
  else showToast('Use A/D ou ← →, Espaço ou ↑ para pular. Mantenha os botoes pressionados para correr!');
  render();
})();

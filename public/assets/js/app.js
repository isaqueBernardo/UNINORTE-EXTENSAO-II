/* UI acessivel: menu, revelacao, senha e selecao segura de turma. */
(() => {
  'use strict';
  const nav = document.querySelector('[data-menu-toggle]');
  const links = document.querySelector('.nav-links');
  if (nav && links) nav.addEventListener('click', () => {
    const opened = links.classList.toggle('is-open');
    nav.setAttribute('aria-expanded', opened ? 'true' : 'false');
  });

  const elements = document.querySelectorAll('.reveal');
  if ('IntersectionObserver' in window && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (!entry.isIntersecting) return;
        entry.target.classList.add('is-visible');
        observer.unobserve(entry.target);
      });
    }, { threshold: .08, rootMargin: '0px 0px 35px 0px' });
    elements.forEach(el => observer.observe(el));
  } else elements.forEach(el => el.classList.add('is-visible'));

  document.querySelectorAll('[data-show-password]').forEach(btn => {
    btn.addEventListener('click', () => {
      const el = document.querySelector(btn.dataset.showPassword);
      if (!el) return;
      el.type = el.type === 'password' ? 'text' : 'password';
      btn.setAttribute('aria-label', el.type === 'text' ? 'Ocultar senha' : 'Mostrar senha');
    });
  });
  const pass = document.getElementById('reg-password');
  const meter = document.querySelector('[data-password-meter]');
  if (pass && meter) pass.addEventListener('input', () => {
    const value = pass.value;
    const strength = [value.length >= 10, /[A-Z]/.test(value), /[0-9]/.test(value), /[^a-zA-Z0-9]/.test(value)].filter(Boolean).length;
    meter.style.width = `${strength * 25}%`;
    meter.style.background = strength >= 3 ? '#51ba42' : strength >= 2 ? '#f4c542' : '#f0835d';
  });

  const schoolInput = document.getElementById('school-code');
  const classInput = document.getElementById('classroom-select');
  const schoolStatus = document.getElementById('school-status');
  if (schoolInput && classInput) {
    let requestNumber = 0;
    async function updateSchool() {
      const code = schoolInput.value.trim().toUpperCase();
      const ownRequest = ++requestNumber;
      classInput.replaceChildren(new Option('Sem turma / nao informada', ''));
      if (!code) { schoolStatus.textContent = 'Informe o codigo da escola.'; return; }
      schoolStatus.textContent = 'Verificando escola...';
      try {
        const res = await fetch(`/escola/turmas?code=${encodeURIComponent(code)}`, { headers: { Accept: 'application/json' } });
        if (!res.ok) throw new Error('Consulta indisponivel');
        const data = await res.json();
        if (ownRequest !== requestNumber) return;
        schoolStatus.textContent = data.name ? `✓ ${data.name}` : 'Codigo nao encontrado. Confira com a escola.';
        for (const item of data.classrooms) classInput.add(new Option(`${item.name} (${item.school_year})`, item.id));
      } catch (_) { if (ownRequest === requestNumber) schoolStatus.textContent = 'Nao foi possivel verificar agora.'; }
    }
    let delay;
    schoolInput.addEventListener('input', () => { clearTimeout(delay); delay = setTimeout(updateSchool, 500); });
    if (schoolInput.value) updateSchool();
  }
  const arrival = document.getElementById('arrival-curtain');
  if (arrival) {
    requestAnimationFrame(() => arrival.classList.add('is-opening'));
    window.setTimeout(() => arrival.remove(), 1600);
  }
})();

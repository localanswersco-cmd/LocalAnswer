<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Local Answer</title>
  <meta
    name="description"
    content="Local Answer helps small businesses show up in AI answers when people ask for the best local option."
  />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
    rel="stylesheet"
  >
  <style>
    :root {
      --bg: #f5f8fc;
      --card: #ffffff;
      --text: #0f172a;
      --muted: #5b6475;
      --line: #e5e7eb;
      --blue: #2563eb;
      --blue-dark: #1d4ed8;
      --navy: #020617;
      --navy-2: #0f172a;
      --green: #10b981;
      --shadow: 0 20px 50px rgba(15, 23, 42, 0.10);
      --shadow-soft: 0 10px 30px rgba(15, 23, 42, 0.07);
      --radius: 24px;
    }

    * { box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      margin: 0;
      font-family: "Inter", sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.5;
    }

    a { text-decoration: none; color: inherit; }
    img { max-width: 100%; display: block; }

    .container {
      width: min(1180px, calc(100% - 32px));
      margin: 0 auto;
    }

    .hero {
      position: relative;
      overflow: hidden;
      background:
        radial-gradient(circle at 20% 20%, rgba(37, 99, 235, 0.25), transparent 22%),
        radial-gradient(circle at 85% 30%, rgba(99, 102, 241, 0.22), transparent 24%),
        radial-gradient(circle at 55% 100%, rgba(34, 211, 238, 0.18), transparent 26%),
        linear-gradient(135deg, #0f172a 0%, #020617 100%);
      color: white;
    }

    .topbar {
      margin-top: 20px;
      padding: 14px 18px;
      border: 1px solid rgba(255,255,255,0.10);
      border-radius: 999px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 16px;
      background: rgba(255,255,255,0.05);
      backdrop-filter: blur(12px);
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 12px;
      font-weight: 600;
      letter-spacing: 0.2px;
    }

    .brand-badge {
      width: 36px;
      height: 36px;
      border-radius: 999px;
      background: rgba(37, 99, 235, 0.18);
      display: grid;
      place-items: center;
      font-size: 16px;
    }

    .small-pill {
      padding: 7px 12px;
      border-radius: 999px;
      border: 1px solid rgba(255,255,255,0.10);
      color: rgba(255,255,255,0.72);
      font-size: 12px;
    }

    .hero-grid {
      display: grid;
      grid-template-columns: 1.1fr 0.9fr;
      gap: 44px;
      align-items: center;
      padding: 56px 0 88px;
    }

    .eyebrow {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 10px 14px;
      border-radius: 999px;
      background: rgba(59,130,246,0.14);
      color: #dbeafe;
      border: 1px solid rgba(96,165,250,0.16);
      font-size: 14px;
      font-weight: 600;
    }

    .hero h1 {
      margin: 20px 0 0;
      font-size: clamp(42px, 6vw, 68px);
      line-height: 1.03;
      letter-spacing: -0.04em;
      max-width: 720px;
    }

    .hero p.lead {
      margin: 20px 0 0;
      max-width: 640px;
      font-size: 20px;
      color: rgba(255,255,255,0.78);
      line-height: 1.75;
    }

    .cta-row {
      display: flex;
      flex-wrap: wrap;
      gap: 14px;
      margin-top: 28px;
    }

    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      padding: 14px 22px;
      border-radius: 18px;
      font-weight: 700;
      font-size: 15px;
      transition: 0.2s ease;
      cursor: pointer;
    }

    .btn:hover { transform: translateY(-1px); }

    .btn-primary {
      background: white;
      color: var(--text);
      box-shadow: 0 16px 30px rgba(255,255,255,0.12);
    }

    .btn-secondary {
      color: white;
      border: 1px solid rgba(255,255,255,0.14);
      background: rgba(255,255,255,0.05);
    }

    .mini-grid {
      margin-top: 34px;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 14px;
      max-width: 720px;
    }

    .mini-card {
      background: rgba(255,255,255,0.05);
      border: 1px solid rgba(255,255,255,0.09);
      backdrop-filter: blur(12px);
      border-radius: 22px;
      padding: 18px;
    }

    .mini-card h3 {
      margin: 0;
      font-size: 24px;
      line-height: 1.1;
    }

    .mini-card p {
      margin: 8px 0 0;
      color: rgba(255,255,255,0.68);
      font-size: 14px;
    }

    .demo-wrap {
      position: relative;
    }

    .demo-glow {
      position: absolute;
      inset: -16px;
      background: linear-gradient(135deg, rgba(37,99,235,0.25), rgba(34,211,238,0.12));
      filter: blur(28px);
      border-radius: 36px;
    }

    .demo-card {
      position: relative;
      border-radius: 34px;
      padding: 18px;
      background: rgba(255,255,255,0.96);
      color: var(--text);
      box-shadow: 0 26px 60px rgba(2, 6, 23, 0.35);
    }

    .demo-top {
      padding: 14px 16px;
      border-radius: 18px;
      background: #f8fafc;
      border: 1px solid #e2e8f0;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
    }

    .demo-title {
      display: flex;
      align-items: center;
      gap: 8px;
      color: #64748b;
      font-size: 14px;
      font-weight: 600;
    }

    .dots { display: flex; gap: 8px; }
    .dot {
      width: 10px; height: 10px; border-radius: 999px;
    }
    .red { background: #fb7185; }
    .yellow { background: #fbbf24; }
    .green { background: #34d399; }

    .demo-inner {
      margin-top: 14px;
      border-radius: 24px;
      padding: 20px;
      background: var(--navy);
      color: white;
    }

    .label {
      font-size: 11px;
      text-transform: uppercase;
      letter-spacing: 0.2em;
      color: rgba(255,255,255,0.42);
    }

    .typing-box {
      margin-top: 12px;
      min-height: 54px;
      border-radius: 16px;
      border: 1px solid rgba(255,255,255,0.10);
      background: rgba(255,255,255,0.05);
      padding: 14px 16px;
      font-size: 16px;
      color: rgba(255,255,255,0.95);
    }

    .cursor {
      display: inline-block;
      width: 2px;
      height: 18px;
      margin-left: 4px;
      background: #93c5fd;
      vertical-align: middle;
      animation: blink 0.9s infinite;
    }

    @keyframes blink {
      0%, 40% { opacity: 1; }
      41%, 100% { opacity: 0; }
    }

    .ai-response {
      margin-top: 18px;
      border-radius: 20px;
      background: white;
      color: var(--text);
      padding: 18px;
    }

    .ai-response small {
      color: #64748b;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .ai-response p {
      margin: 12px 0 0;
      color: #334155;
      line-height: 1.8;
      font-size: 15px;
    }

    .tag-row {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
      margin-top: 14px;
    }

    .tag {
      padding: 7px 11px;
      border-radius: 999px;
      background: #eff6ff;
      color: #1d4ed8;
      font-size: 12px;
      font-weight: 600;
    }

    .demo-stats {
      margin-top: 14px;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 12px;
    }

    .demo-stat {
      border: 1px solid #e2e8f0;
      background: #f8fafc;
      border-radius: 18px;
      padding: 14px;
    }

    .demo-stat small {
      color: #64748b;
      text-transform: uppercase;
      letter-spacing: 0.18em;
      font-size: 10px;
      font-weight: 700;
    }

    .demo-stat p {
      margin: 8px 0 0;
      font-size: 14px;
      font-weight: 600;
      color: #0f172a;
      line-height: 1.5;
    }

    section.content {
      padding: 92px 0;
    }

    .section-grid {
      display: grid;
      grid-template-columns: 0.92fr 1.08fr;
      gap: 30px;
      align-items: start;
    }

    .section-kicker {
      color: var(--blue);
      text-transform: uppercase;
      letter-spacing: 0.22em;
      font-size: 12px;
      font-weight: 800;
    }

    .section-title {
      margin: 14px 0 0;
      font-size: clamp(30px, 4vw, 42px);
      line-height: 1.1;
      letter-spacing: -0.03em;
    }

    .section-text {
      margin: 16px 0 0;
      color: var(--muted);
      font-size: 18px;
      line-height: 1.8;
    }

    .cards-2 {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 16px;
    }

    .card {
      background: var(--card);
      border: 1px solid var(--line);
      border-radius: 26px;
      padding: 24px;
      box-shadow: var(--shadow-soft);
    }

    .icon-box {
      width: 46px;
      height: 46px;
      border-radius: 16px;
      display: grid;
      place-items: center;
      font-size: 20px;
      margin-bottom: 16px;
    }

    .blue-bg { background: #eff6ff; color: #2563eb; }
    .indigo-bg { background: #eef2ff; color: #4f46e5; }
    .cyan-bg { background: #ecfeff; color: #0891b2; }
    .green-bg { background: #ecfdf5; color: #059669; }

    .card h3 {
      margin: 0;
      font-size: 22px;
      letter-spacing: -0.02em;
    }

    .card p {
      margin: 12px 0 0;
      color: var(--muted);
      line-height: 1.8;
    }

    .center-head {
      max-width: 820px;
      margin: 0 auto;
      text-align: center;
    }

    .steps-grid,
    .pricing-grid,
    .industry-grid {
      display: grid;
      gap: 18px;
    }

    .steps-grid { grid-template-columns: repeat(3, 1fr); margin-top: 54px; }
    .pricing-grid { grid-template-columns: repeat(3, 1fr); margin-top: 54px; }
    .industry-grid { grid-template-columns: repeat(3, 1fr); margin-top: 26px; }

    .step-card {
      border: 1px solid var(--line);
      border-radius: 30px;
      background: linear-gradient(to bottom, #ffffff, #f8fafc);
      padding: 28px;
      box-shadow: var(--shadow-soft);
    }

    .step-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .step-number {
      color: #94a3b8;
      font-weight: 700;
      font-size: 14px;
    }

    .step-card h3 {
      margin: 22px 0 0;
      font-size: 28px;
      letter-spacing: -0.03em;
    }

    .step-card p {
      margin: 14px 0 0;
      color: var(--muted);
      line-height: 1.8;
    }

    .dark-panel {
      background: var(--navy);
      color: white;
      border-radius: 34px;
      padding: 34px;
      box-shadow: var(--shadow);
    }

    .dark-panel h2 {
      margin: 12px 0 0;
      font-size: 36px;
      letter-spacing: -0.03em;
    }

    .dark-panel p {
      margin: 14px 0 0;
      color: rgba(255,255,255,0.75);
      line-height: 1.8;
    }

    .example-grid {
      margin-top: 28px;
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 14px;
    }

    .example-card-shell {
      border-radius: 24px;
      border: 1px solid rgba(255,255,255,0.10);
      background: rgba(255,255,255,0.05);
      padding: 14px;
    }

    .example-card {
      border-radius: 18px;
      background: white;
      color: var(--text);
      padding: 18px;
    }

    .example-card small {
      display: block;
      color: #94a3b8;
      text-transform: uppercase;
      letter-spacing: 0.18em;
      font-size: 10px;
      font-weight: 700;
    }

    .example-card h3 {
      margin: 10px 0 0;
      font-size: 22px;
      letter-spacing: -0.02em;
    }

    .example-card p {
      margin: 10px 0 0;
      color: #64748b;
      line-height: 1.7;
      font-size: 14px;
    }

    .split-grid {
      display: grid;
      grid-template-columns: 1.04fr 0.96fr;
      gap: 28px;
      align-items: start;
    }

    .industry-pill {
      border: 1px solid #dbeafe;
      background: linear-gradient(to bottom, #eff6ff, #ffffff);
      border-radius: 20px;
      padding: 16px 10px;
      text-align: center;
      font-size: 14px;
      font-weight: 600;
      color: #334155;
      box-shadow: var(--shadow-soft);
    }

    .note-card {
      margin-top: 22px;
      background: white;
      border: 1px solid var(--line);
      border-radius: 26px;
      padding: 22px;
      box-shadow: var(--shadow-soft);
    }

    .note-card h3 {
      margin: 0;
      font-size: 22px;
    }

    .note-card p {
      margin: 10px 0 0;
      color: var(--muted);
      line-height: 1.8;
    }

    .pricing-section {
      background: var(--navy);
      color: white;
    }

    .pricing-card {
      border-radius: 30px;
      padding: 28px;
      border: 1px solid rgba(255,255,255,0.10);
      background: rgba(255,255,255,0.05);
      box-shadow: var(--shadow);
    }

    .pricing-card.featured {
      border-color: rgba(96,165,250,0.35);
      background: linear-gradient(to bottom, rgba(59,130,246,0.14), rgba(255,255,255,0.05));
    }

    .pricing-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 14px;
    }

    .pricing-top h3 {
      margin: 0;
      font-size: 30px;
    }

    .badge {
      border-radius: 999px;
      padding: 8px 12px;
      font-size: 11px;
      font-weight: 800;
      letter-spacing: 0.04em;
      background: rgba(255,255,255,0.10);
      color: rgba(255,255,255,0.74);
      white-space: nowrap;
    }

    .featured .badge {
      background: rgba(59,130,246,0.18);
      color: #dbeafe;
    }

    .price-row {
      margin-top: 18px;
      display: flex;
      align-items: flex-end;
      gap: 10px;
    }

    .price {
      font-size: 56px;
      font-weight: 800;
      letter-spacing: -0.05em;
      line-height: 1;
    }

    .per {
      color: rgba(255,255,255,0.64);
      font-size: 14px;
      padding-bottom: 8px;
    }

    .feature-list {
      margin: 20px 0 0;
      padding: 0;
      list-style: none;
      display: grid;
      gap: 12px;
    }

    .feature-list li {
      display: flex;
      gap: 10px;
      color: rgba(255,255,255,0.82);
      line-height: 1.6;
    }

    .check {
      color: #93c5fd;
      font-weight: 800;
      flex: none;
    }

    .pricing-note {
      margin-top: 24px;
      text-align: center;
      color: rgba(255,255,255,0.55);
      font-size: 14px;
    }

    .contact-wrap {
      background: white;
      border: 1px solid var(--line);
      border-radius: 34px;
      padding: 32px;
      box-shadow: var(--shadow);
    }

    .contact-grid {
      display: grid;
      grid-template-columns: 1fr 0.92fr;
      gap: 26px;
      align-items: center;
    }

    .chips {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      margin-top: 20px;
    }

    .chip {
      padding: 8px 12px;
      border-radius: 999px;
      background: #f1f5f9;
      color: #475569;
      font-size: 14px;
      font-weight: 500;
    }

    .contact-card {
      background: var(--navy);
      color: white;
      border-radius: 26px;
      padding: 24px;
    }

    .contact-card p.top {
      margin: 0;
      color: rgba(255,255,255,0.58);
      font-size: 14px;
    }

    .contact-box {
      margin-top: 14px;
      display: grid;
      gap: 10px;
    }

    .contact-line {
      border-radius: 16px;
      background: rgba(255,255,255,0.06);
      padding: 14px 16px;
      color: rgba(255,255,255,0.82);
      font-size: 15px;
    }

    .footer-note {
      margin-top: 18px;
      color: rgba(255,255,255,0.55);
      text-align: center;
      font-size: 14px;
    }

    .section-spacing { padding: 92px 0; }

    @media (max-width: 1024px) {
      .hero-grid,
      .section-grid,
      .split-grid,
      .contact-grid {
        grid-template-columns: 1fr;
      }

      .steps-grid,
      .pricing-grid {
        grid-template-columns: 1fr;
      }

      .mini-grid,
      .cards-2,
      .demo-stats,
      .example-grid,
      .industry-grid {
        grid-template-columns: 1fr;
      }

      .small-pill { display: none; }
    }

    @media (max-width: 640px) {
      .hero-grid { padding: 36px 0 68px; }
      .topbar { padding: 12px 14px; }
      .hero h1 { font-size: 40px; }
      .hero p.lead { font-size: 18px; }
      .contact-wrap,
      .dark-panel,
      .pricing-card,
      .step-card,
      .card,
      .demo-card {
        padding: 20px;
      }
    }
  </style>
</head>
<body>
  <section class="hero">
    <div class="container">
      <div class="topbar">
        <div class="brand">
          <div class="brand-badge">✦</div>
          <span>Local Answer</span>
        </div>
        <div class="small-pill">Small startup • simple plans • personal service</div>
      </div>

      <div class="hero-grid">
        <div>
          <div class="eyebrow">✦ Built for how people search now</div>

          <h1>Show up when people ask AI who the best option is</h1>

          <p class="lead">
            I help small businesses improve how they appear in AI answers with simple content, smart placement, and affordable monthly support.
          </p>

          <div class="cta-row">
            <a class="btn btn-primary" href="#pricing">View pricing →</a>
            <a class="btn btn-secondary" href="#demo">See live demo</a>
          </div>

          <div class="mini-grid">
            <div class="mini-card">
              <h3>Simple</h3>
              <p>Easy to understand and easy to start</p>
            </div>
            <div class="mini-card">
              <h3>Affordable</h3>
              <p>Priced for small businesses and early clients</p>
            </div>
            <div class="mini-card">
              <h3>Personal</h3>
              <p>Built and run directly by Samuel Richardson</p>
            </div>
          </div>
        </div>

        <div class="demo-wrap" id="demo">
          <div class="demo-glow"></div>
          <div class="demo-card">
            <div class="demo-top">
              <div class="demo-title">💬 Live demo</div>
              <div class="dots">
                <span class="dot red"></span>
                <span class="dot yellow"></span>
                <span class="dot green"></span>
              </div>
            </div>

            <div class="demo-inner">
              <div class="label">Example prompt</div>
              <div class="typing-box">
                <span id="typed-text"></span><span class="cursor"></span>
              </div>

              <div class="ai-response">
                <small>🤖 AI response preview</small>
                <p>
                  A strong option could be <strong>your business</strong>, especially if it has a clear online presence, strong service descriptions, and consistent mentions across the web.
                </p>
                <div class="tag-row">
                  <span class="tag">Clear service page</span>
                  <span class="tag">Consistent business info</span>
                  <span class="tag">Visible online presence</span>
                </div>
              </div>
            </div>

            <div class="demo-stats">
              <div class="demo-stat">
                <small>Result</small>
                <p>Better visibility in AI answers</p>
              </div>
              <div class="demo-stat">
                <small>Approach</small>
                <p>Simple content and smart placement</p>
              </div>
              <div class="demo-stat">
                <small>Fit</small>
                <p>Best for small local businesses</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="content">
    <div class="container">
      <div class="section-grid">
        <div>
          <div class="section-kicker">Why this matters</div>
          <h2 class="section-title">People are asking AI first</h2>
          <p class="section-text">
            That means businesses need to be easier for AI tools to understand and recommend. This is a simple service designed to help with that shift.
          </p>
        </div>

        <div class="cards-2">
          <div class="card">
            <div class="icon-box blue-bg">▣</div>
            <h3>Clear and simple</h3>
            <p>No complicated agency language. Just a straightforward service to help your business show up more often.</p>
          </div>
          <div class="card">
            <div class="icon-box indigo-bg">$</div>
            <h3>Lower starting cost</h3>
            <p>Built with small companies in mind, with pricing that is realistic for getting started.</p>
          </div>
          <div class="card">
            <div class="icon-box cyan-bg">⌖</div>
            <h3>Great for local businesses</h3>
            <p>Especially useful for businesses that rely on recommendations, trust, and being found quickly.</p>
          </div>
          <div class="card">
            <div class="icon-box green-bg">↗</div>
            <h3>Built to grow with you</h3>
            <p>Start simple, then expand as your business adds more services, pages, and visibility.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section-spacing" style="background:#fff;">
    <div class="container">
      <div class="center-head">
        <div class="section-kicker">How it works</div>
        <h2 class="section-title">A simple three-step process</h2>
        <p class="section-text">
          This is not built like a giant agency package. It is a focused service with a clear goal: help your business become easier for AI tools to find and mention.
        </p>
      </div>

      <div class="steps-grid">
        <div class="step-card">
          <div class="step-top">
            <div class="icon-box" style="background:#0f172a;color:white;margin:0;">⌕</div>
            <div class="step-number">01</div>
          </div>
          <h3>Prompt research</h3>
          <p>I look at the questions people are already asking AI about your kind of business.</p>
        </div>

        <div class="step-card">
          <div class="step-top">
            <div class="icon-box" style="background:#0f172a;color:white;margin:0;">✦</div>
            <div class="step-number">02</div>
          </div>
          <h3>Clear content</h3>
          <p>I build simple pages and web content that AI systems can understand more easily.</p>
        </div>

        <div class="step-card">
          <div class="step-top">
            <div class="icon-box" style="background:#0f172a;color:white;margin:0;">↗</div>
            <div class="step-number">03</div>
          </div>
          <h3>Smart placement</h3>
          <p>I help place that content in the right spots online so your business has more visibility.</p>
        </div>
      </div>
    </div>
  </section>

  <section class="section-spacing">
    <div class="container">
      <div class="split-grid">
        <div class="dark-panel">
          <div class="section-kicker" style="color:#93c5fd;">Example visuals</div>
          <h2>What this can look like in practice</h2>
          <p>
            These examples help people quickly understand the service. They make the site feel more real without pretending the business is larger than it is.
          </p>

          <div class="example-grid">
            <div class="example-card-shell">
              <div class="example-card">
                <small>Business example</small>
                <h3>Smith Family Dental</h3>
                <p>Clear service pages, location details, and simple explanations that AI can understand.</p>
              </div>
            </div>

            <div class="example-card-shell">
              <div class="example-card">
                <small>Prompt example</small>
                <h3>“Best dentist near me”</h3>
                <p>The goal is to make your business easier for AI to recognize as a quality option.</p>
              </div>
            </div>
          </div>
        </div>

        <div>
          <div class="section-kicker">Best fit</div>
          <h2 class="section-title">Who this is for</h2>
          <p class="section-text">
            This works best for service businesses where being recommended matters more than having a flashy brand.
          </p>

          <div class="industry-grid">
            <div class="industry-pill">Local businesses</div>
            <div class="industry-pill">Contractors</div>
            <div class="industry-pill">Real estate</div>
            <div class="industry-pill">Advisors</div>
            <div class="industry-pill">Medical offices</div>
            <div class="industry-pill">Small teams</div>
          </div>

          <div class="note-card">
            <h3>Good first clients</h3>
            <p>
              Businesses with one location, one clear service, and a need for more local visibility are often the best place to start.
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="pricing-section section-spacing" id="pricing">
    <div class="container">
      <div class="center-head">
        <div class="section-kicker" style="color:#93c5fd;">Pricing</div>
        <h2 class="section-title" style="color:white;">Affordable pricing for a small startup</h2>
        <p class="section-text" style="color:rgba(255,255,255,0.72);">
          These prices are built to feel realistic for early clients and small businesses, not inflated like a big agency package.
        </p>
      </div>

      <div class="pricing-grid">
        <div class="pricing-card">
          <div class="pricing-top">
            <h3>Starter</h3>
            <div class="badge">Best for testing</div>
          </div>
          <div class="price-row">
            <div class="price">$149</div>
            <div class="per">/month</div>
          </div>
          <ul class="feature-list">
            <li><span class="check">✓</span><span>1 business profile setup</span></li>
            <li><span class="check">✓</span><span>Basic AI visibility review</span></li>
            <li><span class="check">✓</span><span>Simple content recommendations</span></li>
            <li><span class="check">✓</span><span>Monthly check-in</span></li>
          </ul>
          <div class="cta-row" style="margin-top:22px;">
            <a class="btn btn-secondary" style="width:100%;" href="#contact">Choose Starter</a>
          </div>
        </div>

        <div class="pricing-card featured">
          <div class="pricing-top">
            <h3>Growth</h3>
            <div class="badge">Most popular</div>
          </div>
          <div class="price-row">
            <div class="price">$299</div>
            <div class="per">/month</div>
          </div>
          <ul class="feature-list">
            <li><span class="check">✓</span><span>Everything in Starter</span></li>
            <li><span class="check">✓</span><span>Content creation support</span></li>
            <li><span class="check">✓</span><span>More placements and updates</span></li>
            <li><span class="check">✓</span><span>Monthly visibility report</span></li>
          </ul>
          <div class="cta-row" style="margin-top:22px;">
            <a class="btn btn-primary" style="width:100%;" href="#contact">Choose Growth</a>
          </div>
        </div>

        <div class="pricing-card">
          <div class="pricing-top">
            <h3>Custom</h3>
            <div class="badge">For bigger needs</div>
          </div>
          <div class="price-row">
            <div class="price">$499+</div>
            <div class="per">/month</div>
          </div>
          <ul class="feature-list">
            <li><span class="check">✓</span><span>For multiple services or locations</span></li>
            <li><span class="check">✓</span><span>Ongoing updates</span></li>
            <li><span class="check">✓</span><span>Priority support</span></li>
            <li><span class="check">✓</span><span>Custom plan based on goals</span></li>
          </ul>
          <div class="cta-row" style="margin-top:22px;">
            <a class="btn btn-secondary" style="width:100%;" href="#contact">Choose Custom</a>
          </div>
        </div>
      </div>

      <div class="pricing-note">
        Early-stage pricing shown here as an example. Final pricing can be adjusted based on the amount of work and how many services a business needs.
      </div>
    </div>
  </section>

  <section class="section-spacing" id="contact">
    <div class="container">
      <div class="contact-wrap">
        <div class="contact-grid">
          <div>
            <div class="section-kicker">Get started</div>
            <h2 class="section-title">Start showing up where people are searching now</h2>
            <p class="section-text">
              If you want a simple way to improve how your business appears in AI answers, reach out and I can help you get started.
            </p>

            <div class="chips">
              <div class="chip">Simple setup</div>
              <div class="chip">Monthly support</div>
              <div class="chip">Personal service</div>
            </div>
          </div>

          <div class="contact-card">
            <p class="top">Contact</p>
            <div class="contact-box">
              <div class="contact-line">localanswers.co@gmail.com</div>
              <div class="contact-line">Local Answer</div>
            </div>
            <div class="cta-row">
              <a class="btn" style="width:100%;background:#2563eb;color:white;" href="mailto:localanswers.co@gmail.com">Contact me</a>
            </div>
            <div class="footer-note">Built and operated by Samuel Richardson</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <script>
    const prompts = [
      "best accountant near me",
      "best real estate team in my area",
      "best local contractor for renovations",
      "best marketing help for a small business"
    ];

    const typedText = document.getElementById("typed-text");
    let promptIndex = 0;
    let charIndex = 0;
    let deleting = false;

    function typeLoop() {
      const current = prompts[promptIndex];

      if (!deleting) {
        typedText.textContent = current.slice(0, charIndex + 1);
        charIndex++;

        if (charIndex === current.length) {
          deleting = true;
          setTimeout(typeLoop, 1400);
          return;
        }
      } else {
        typedText.textContent = current.slice(0, charIndex - 1);
        charIndex--;

        if (charIndex === 0) {
          deleting = false;
          promptIndex = (promptIndex + 1) % prompts.length;
        }
      }

      setTimeout(typeLoop, deleting ? 28 : 55);
    }

    typeLoop();
  </script>
</body>
</html>

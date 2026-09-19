# 🗺️ Roadmap & Backlog

> Planejamento estratégico, status operacional e visão de futuro para a evolução do **Universal Helix**.

---

## 📊 Status do Projeto

| Área                                              |   Status   | Cobertura / Estado                                                  |
| :------------------------------------------------ | :--------: | :------------------------------------------------------------------ |
| **🧬 Configuração Central (`config.toml`)**       | 🟢 Estável | Ergonomia modal, cursores múltiplos e comportamento limpo           |
| **🎨 Tema Visual (`dark_plus`)**                  | 🟢 Estável | Contraste refinado e identidade consistente                         |
| **📑 Linguagens & Formatação (`languages.toml`)** | 🟢 Estável | Indentação e formatadores granulares configurados                   |
| **🌐 LSP & Tree-sitter Nativos**                  | 🟢 Estável | Utilização plena dos recursos nativos do Helix sem plugins externos |
| **⚡ Interface de Componente (`helix.sh`)**       | 🟢 Estável | Comandos de teste, doctor e update unificados                       |
| **🧪 Validação de Sintaxe TOML**                  |  🟢 100%   | Validação sintática completa no CI e Makefile                       |

---

## 🎯 Grandes Épicos & Backlog

### 1. ⌨️ Ergonomia & Mapeamentos de Teclas

- [ ] Refinar mapeamento de atalhos em modo normal e de seleção para operações frequentes.
- [ ] Explorar atalhos de buffer switching mais ágeis e atalhos de janelas divididas.

### 2. 🛠️ Cobertura de Linguagens & Language Servers

- [ ] Ampliar diagnósticos e formatadores para C23 (`clangd`), Elisp e Shell POSIX.
- [ ] Avaliar integração com Typst, Nix e novas especificações de language servers.

### 3. 🎨 Identidade Visual & Temas

- [ ] Avaliar suporte e fallbacks para variantes de temas escuros/claros de alto contraste.
- [ ] Aperfeiçoar rendering de statusline e breadcrumbs contextuais.

---

> [!TIP]
> Para detalhes sobre convenções de código e diretrizes de engenharia, consulte o [PRINCIPLES.md](PRINCIPLES.md) e o [ENVIRONMENT.md](ENVIRONMENT.md).

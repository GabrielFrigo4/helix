# 🧬 Universal Helix Configuration

> Configuração declarativa, minimalista e ergonômica para o editor modal Helix.

[![Environment](https://img.shields.io/badge/🏛️_Environment-Hub-blue)](https://github.com/GabrielFrigo4/environment)
[![Helix](https://img.shields.io/badge/Helix-Modal_Editor-black?logo=helix&logoColor=white)](https://helix-editor.com/)
[![TOML](https://img.shields.io/badge/Format-TOML_1.0-orange?logo=toml&logoColor=white)](config.toml)
[![License](https://img.shields.io/badge/License-MIT-green?logo=open-source-initiative&logoColor=white)](LICENSE)

---

## 🧭 Visão Geral

Este repositório contém a configuração oficial do **Helix** de Gabriel Frigo, integrando a **Suíte de Editores** do [Universal Environment](https://github.com/GabrielFrigo4/environment). A configuração foca em:

- **Ergonomia Modal Pós-Moderna:** Mapeamento intuitivo de cursores e seleções.
- **Tema dark_plus:** Contraste visual equilibrado e confortável.
- **Formatação Granular de Linguagens:** Indentação padronizada por tabs e espaços em `languages.toml`.
- **Zero Config Bloat:** Dependência zero de plugins externos, aproveitando o LSP e tree-sitter nativos do Helix.

---

## 📁 Catálogo da Estrutura

| Arquivo                            | Descrição                                                         |
| :--------------------------------- | :---------------------------------------------------------------- |
| [`helix.sh`](helix.sh)             | Interface unificada de componente (CLI para test, doctor, update) |
| [`config.toml`](config.toml)       | Configuração principal do editor, tema visual, cursor e teclas    |
| [`languages.toml`](languages.toml) | Definição de indentação e servidores por linguagem                |
| [`AGENTS.md`](AGENTS.md)           | Briefing arquitetural para agentes de inteligência artificial     |
| [`PRINCIPLES.md`](PRINCIPLES.md)   | Os 18 Princípios de Engenharia UNIX + Clean Code                  |
| [`ENVIRONMENT.md`](ENVIRONMENT.md) | Manifesto do ecossistema Universal Environment                    |

---

## 🚀 Instalação e Uso Rápido

### Opção A — Modo Versionado (Recomendado para Manutenção)

Clona o repositório diretamente no destino canônico com controle de versão Git ativo, permitindo atualizações automáticas contínuas via `uped` ou `git pull`.

#### 🐧 Unix (Linux, FreeBSD, macOS)

```sh
git clone "https://github.com/GabrielFrigo4/helix.git" "${HOME}/.config/helix"
```

#### 🪟 Windows (PowerShell Nativo)

```powershell
git clone "https://github.com/GabrielFrigo4/helix.git" "$env:APPDATA\helix"
```

#### 🪟 Windows (MSYS2 / Git Bash)

```sh
git clone "https://github.com/GabrielFrigo4/helix.git" "${HOME}/.config/helix"
```

---

### Opção B — Modo Standalone Limpo (Zero-Bloat / Produção)

> [!TIP]
> **Filosofia Zero-Bloat:** Ideal para servidores, contêineres ou computadores de terceiros onde o controle de versão Git e artefatos de desenvolvimento não são necessários. Clona a árvore rasa (`--depth=1`) e remove metadados (`.git*`, `.agents`, `*.md`), deixando apenas a configuração estritamente executável.

#### 🐧 Unix (Linux, FreeBSD, macOS & MSYS2)

```sh
git clone --depth=1 "https://github.com/GabrielFrigo4/helix.git" "${HOME}/.config/helix" && \
  rm -rf "${HOME}/.config/helix/.git"* "${HOME}/.config/helix/.agents" "${HOME}/.config/helix/"*.md
```

#### 🪟 Windows (PowerShell)

```powershell
git clone --depth=1 "https://github.com/GabrielFrigo4/helix.git" "$env:APPDATA\helix"
Remove-Item -Recurse -Force "$env:APPDATA\helix\.git*", "$env:APPDATA\helix\.agents", "$env:APPDATA\helix\*.md" -ErrorAction SilentlyContinue
```

---

### ⚙️ Integração com o Universal Environment

Quando operado a partir do [Universal Environment](https://github.com/GabrielFrigo4/environment):

```sh
# Atualizar a suíte de editores com o upstream
make uped

# Implantar o repositório no destino canônico (~/.config/helix)
make deploy
```

---

### 🩺 Validação e Saúde

```sh
# Verificar diagnóstico completo do Helix
hx --health
```

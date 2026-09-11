# 🧬 Helix Editor Configuration

> Configuração declarativa, minimalista e ergonômica para o editor modal Helix.

[![Environment](https://img.shields.io/badge/🏛️_Environment-Hub-blue)](https://github.com/GabrielFrigo4/environment)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![TOML](https://img.shields.io/badge/format-TOML_1.0-orange)](config.toml)

---

## 🧭 Visão Geral

Este repositório contém a configuração oficial do **Helix** de Gabriel Frigo, integrando a **Suíte de Editores** do [Universal Environment](https://github.com/GabrielFrigo4/environment). A configuração foca em:

- **Ergonomia Modal Pós-Moderna:** Mapeamento intuitivo de cursores e seleções.
- **Tema dark_plus:** Contraste visual equilibrado e confortável.
- **Formatação Granular de Linguagens:** Indentação padronizada por tabs e espaços em `languages.toml`.
- **Zero Config Bloat:** Dependência zero de plugins externos, aproveitando o LSP e tree-sitter nativos do Helix.

---

## 📁 Catálogo da Estrutura

| Arquivo                            | Descrição                                                      |
| :--------------------------------- | :------------------------------------------------------------- |
| [`config.toml`](config.toml)       | Configuração principal do editor, tema visual, cursor e teclas |
| [`languages.toml`](languages.toml) | Definição de indentação e servidores por linguagem             |
| [`AGENTS.md`](AGENTS.md)           | Briefing arquitetural para agentes de inteligência artificial  |
| [`PRINCIPLES.md`](PRINCIPLES.md)   | Os 18 Princípios de Engenharia UNIX + Clean Code               |
| [`ENVIRONMENT.md`](ENVIRONMENT.md) | Manifesto do ecossistema Universal Environment                 |

---

## 🚀 Instalação e Uso Rápido

### 1. Vincular via Profile

```sh
# Sincronização automática via Universal Environment
make sync

# Ou criação manual de links
mkdir -p "${HOME}/.config/helix"
ln -sf "$(pwd)/config.toml" "${HOME}/.config/helix/config.toml"
ln -sf "$(pwd)/languages.toml" "${HOME}/.config/helix/languages.toml"
```

### 2. Validação e Saúde

```sh
# Verificar diagnóstico completo do Helix
hx --health
```

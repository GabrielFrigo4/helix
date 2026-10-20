---
name: universal-helix
description: Runbook operacional para desenvolvimento, auditoria, testes de integridade TOML e validação de configurações no editor modal Helix. Use ao editar config.toml, customizar languages.toml, auditar servidores LSP ou executar testes sintáticos.
---

# 🧬 Universal Helix — Runbook Operacional

Este runbook orienta desenvolvedores e agentes de inteligência artificial na manutenção, auditoria, testes de sintaxe e configuração do editor modal **Helix**.

---

## 🏛️ Diretrizes & Baseline Arquitetural

1. **Configuração Declarativa & Zero-Bloat:** O Helix adota arquivos TOML puros (`config.toml` e `languages.toml`) sem runtime de plugins interpretados, integrando LSP e Tree-sitter de forma nativa e rápida.
2. **Separação de Papéis:**
    - `config.toml`: Preferências gerais do editor, esquema de cores/tema (`theme = "dark_plus"`), estilo de cursor, réguas visuais e mapeamentos ergonômicos de teclas.
    - `languages.toml`: Definições granulares de indentação (tabs vs espaços, tab-width) e servidores de linguagem por extensão.
3. **Zero Symlinks Manuais:** O repositório opera como clone soberano em `${HOME}/.config/helix` (Unix/MSYS2) ou `%APPDATA%\helix` (Windows).
4. **Ergonomia de Cursor & Atalhos Padronizados (PTY vs Linux TTY):**
    - **Em PTY Gráfico:** Configurado declarativamente via `[editor.cursor-shape]` (`normal = "block"`, `insert = "bar"`, `select = "underline"`) operando via sequências de controle DECSCUSR e tema 24-bit `dark_plus`.
    - **Em Linux Console TTY:** Com `COLORTERM` removido pelo Shell em `_is_raw_tty`, o Helix degrada graciosamente para a paleta ANSI de 16 cores reprogramada no `fbcon` e o cursor é auto-curado pelo wrapper `hx()` no Universal Shell (`\e%G\e[?16;238;0c`).
    - **Simetria de Atalhos com Vim/NeoVim/Emacs:** `A-]` alterna janelas (`rotate_view`), `C-\` e `A-[` abrem o seletor de arquivos no diretório local, `C-p`/`C-f` abrem o `file_picker`, `C-b` abre o `buffer_picker` e `C-g` aciona o `global_search`.

---

## 🧪 1. Validação Sintática de Arquivos TOML

Sempre valide a sintaxe dos arquivos `.toml` antes de efetuar commits ou concluir alterações:

```sh
# Via Makefile canônico
make test

# Ou via script unificado de componente
./helix.sh test

# Ou diretamente via interpretador Python 3 (módulo tomllib nativo)
python3 -c "import tomllib; tomllib.loads(open('config.toml').read()); tomllib.loads(open('languages.toml').read()); print('TOML OK')"
```

> [!IMPORTANT]
> A análise sintática DEVE passar com 100% de integridade. Qualquer erro de sintaxe, aspas não balanceadas ou tipos inválidos causará falha de carregamento no Helix.

---

## 🔍 2. Diagnóstico do Ambiente & LSPs (`doctor` & `--health`)

Para verificar a presença do binário `hx` e seu ambiente:

```sh
./helix.sh doctor
```

Para inspecionar o status de todas as gramáticas Tree-sitter e servidores LSP instalados no sistema:

```sh
hx --health
```

Para checar a saúde de uma linguagem específica (ex: C ou Python):

```sh
hx --health c
hx --health python
```

---

## 🚀 3. Sincronização & Deploy Soberano

O repositório opera de forma autônoma ou coordenado pelo **Universal Environment**:

```sh
# A partir do Universal Environment (orquestrador pai)
make uped    # Atualiza a suite de editores com upstream
make deploy  # Sincroniza clones nos destinos canonicos

# Ou clonagem direta e limpa
git clone "https://github.com/GabrielFrigo4/helix.git" "${HOME}/.config/helix"
```

---

## 🔗 Links Oficiais de Referência

- [Helix Official Website](https://helix-editor.com/)
- [Helix Documentation](https://docs.helix-editor.com/)
- [Helix Configuration Guide](https://docs.helix-editor.com/configuration.html)
- [Helix Languages & LSP Support](https://docs.helix-editor.com/languages.html)

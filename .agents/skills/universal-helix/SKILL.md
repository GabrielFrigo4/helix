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
4. **Ergonomia de Cursor & Atalhos Padronizados (PTY vs Raw TTY):**
    - **Em PTY Gráfico:** Configurado declarativamente via `[editor.cursor-shape]` (`normal = "block"`, `insert = "bar"`, `select = "underline"`) operando via sequências de controle DECSCUSR e tema 24-bit `dark_plus` com scopes de cursor monocromáticos sem inversão (`ui.cursor.*`).
    - **Em Raw TTY (16 Cores):** O wrapper `hx()` no Universal Shell comuta automaticamente para `config-tty.toml` com tema `term16_dark` (`true-color = false`, cursor sólido em software com tons 16-cores imune a anomalias cromáticas e sem inversão reversa), com retorno auto-curado por `_restore_tty_cursor`.
    - **Simetria de Atalhos com Vim/NeoVim/Emacs:** `A-]` alterna janelas (`rotate_view`), `C-\` e `A-[` abrem o seletor de arquivos no diretório local, `C-p`/`C-f` abrem o `file_picker`, `C-b` abre o `buffer_picker` e `C-g` aciona o `global_search`.

---

## 🧪 1. Validação Sintática de Arquivos TOML

Sempre valide a sintaxe dos arquivos `.toml` pelo `Makefile` canônico, script unificado `./helix.sh` ou Python `tomllib`:

```sh
make test
./helix.sh test
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

O repositório opera de forma autônoma (clonagem direta para `~/.config/helix`) ou coordenado pelo **Universal Environment** (`make uped` atualiza a suíte e `make deploy` / `make install` sincroniza clones):

```sh
make uped
make install
git clone "https://github.com/GabrielFrigo4/helix.git" "${HOME}/.config/helix"
```

---

## 🔗 Links Oficiais de Referência

- [Helix Official Website](https://helix-editor.com/)
- [Helix Documentation](https://docs.helix-editor.com/)
- [Helix Configuration Guide](https://docs.helix-editor.com/configuration.html)
- [Helix Languages & LSP Support](https://docs.helix-editor.com/languages.html)

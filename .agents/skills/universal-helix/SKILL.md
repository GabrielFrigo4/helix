---
name: universal-helix
description: >-
    Operational runbook for maintaining, testing, and debugging Gabriel Frigo's Helix configuration.
    Use when editing config.toml, tuning languages.toml, checking helix health, or validating TOML syntax.
---

# Universal Helix — Operational Runbook

Este guia detalha o fluxo operacional para gerenciar, auditar e testar a configuração do Helix.

---

## 1. Validação Sintática de TOML

Sempre teste a sintaxe dos arquivos `.toml` antes de efetuar commits:

```sh
python3 -c "import tomllib; tomllib.loads(open('config.toml').read()); tomllib.loads(open('languages.toml').read()); print('TOML OK')"
```

---

## 2. Diagnóstico de Saúde do Helix

Se o binário `hx` estiver disponível no sistema:

```sh
hx --health
```

---

## 3. Sincronização de Dotfiles

Para vincular esta configuração ao diretório padrão do usuário:

```sh
mkdir -p "${HOME}/.config/helix"
ln -sf "$(pwd)/config.toml" "${HOME}/.config/helix/config.toml"
ln -sf "$(pwd)/languages.toml" "${HOME}/.config/helix/languages.toml"
```

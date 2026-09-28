# 🤝 Guia de Contribuição — Helix Modal Editor

> Diretrizes de desenvolvimento, configuração declarativa TOML e quality gates para o editor modal **Helix**.

---

## 🚀 Setup Inicial da Bancada (Primeiros Passos)

Para clonar e configurar o repositório localmente com todos os ganchos e quality gates ativados:

```sh
# 1. Clonar o repositório
git clone "https://github.com/GabrielFrigo4/helix.git" "${HOME}/Documents/Helix"
cd "${HOME}/Documents/Helix"

# 2. Configurar ganchos Git e permissões canônicas
make hooks

# 3. Validar sintaxe TOML de todas as configurações
make test

# 4. Executar a suíte de validação local
make ci
```

> [!IMPORTANT]
> O comando `make hooks` configura `core.hooksPath -> .githooks` e aplica permissões canônicas `0755` aos ganchos de pre-commit e commit-msg. Execute-o sempre após um novo clone.

---

## 🛡️ Invariantes de Engenharia no Helix

1. **Configuração Declarativa em TOML:**
    - `config.toml`: Preferências gerais do editor, keymaps e tema (`kanagawa`).
    - `languages.toml`: Integração nativa com LSP, formatadores e analisadores estáticos por linguagem.

2. **Invariante de Clonagem "Out-of-the-Box" (Zero-Tweaks Invariant):**
    - Scripts executáveis (`helix.sh`) devem possuir modo octal `100755` no Git Index.
    - Arquivos `.toml`, documentações e licença devem possuir modo `100644`.
    - Se cometer um erro de modo no Git Index, corrija com:
        ```sh
        git update-index --chmod=+x helix.sh
        git update-index --chmod=-x config.toml
        ```

3. **Sintaxe TOML Estrita:**
    - Todo arquivo TOML deve ser parseável sem avisos ou erros pelo módulo nativo `tomllib` do Python 3.11+.

---

## 🪝 Quality Gates & Validação Local

O repositório possui validações automatizadas:

```sh
make test      # Valida integridade e sintaxe TOML
make ci        # Executa bateria de qualidade completa
```

Ganchos Git em `.githooks/`:

- **`pre-commit`:** Verifica whitespace, modos octais no Git Index (0755 vs 0644), sintaxe TOML e formatação.
- **`commit-msg`:** Valida formato semântico da mensagem de commit.

---

## 📝 Convenção de Commits Semânticos

As mensagens de commit devem seguir o formato:

```text
<tipo>(<escopo>): <descrição objetiva>
```

Tipos permitidos: `feat`, `fix`, `refactor`, `docs`, `style`, `test`, `ci`, `chore`.

---

## 📖 Referências Canônicas

- [README.md](README.md) — Visão geral da configuração do Helix
- [PRINCIPLES.md](PRINCIPLES.md) — Princípios de Engenharia e Clean Code
- [AGENTS.md](AGENTS.md) — Briefing para agentes autônomos de IA
- [TODO.md](TODO.md) — Roadmap operacional do Helix

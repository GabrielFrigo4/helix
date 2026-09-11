# 🧬 Helix Engineering Principles & Guidelines

> Regras de engenharia e diretrizes de desenvolvimento para a configuração do Helix.

---

## 🏛️ Invariantes de Configuração TOML

1. **Idempotência & Portabilidade:** As opções em `config.toml` devem funcionar de forma idêntica no Linux, FreeBSD, macOS e Windows.
2. **Indentações Declarativas:** Linguagens em `languages.toml` devem seguir a convenção de indentação universal (tabulação ou espaços conforme o ecossistema da linguagem).
3. **Arquitetura de Comentários em 3 Camadas:**
    - Topo: Header Banner com 64 `-` (`# --------------------------------...`).
    - Seções: Delimitador de 32 `=` (`### ================================`).
    - Subseções: Delimitador de 32 `-` (`### --------------------------------`).
    - Sem comentários inline desnecessários.
4. **Resiliência:** Não habilitar opções de LSP que travem a interface caso servidores de linguagem estejam ausentes no host.

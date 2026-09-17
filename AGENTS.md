# 🧬 Helix Configuration — AI Agent Briefing

> Este é o repositório da **configuração do Helix** de Gabriel Frigo, integrante da **Suíte de Editores** do ecossistema [Universal Environment](https://github.com/GabrielFrigo4/environment).

---

## 🧭 Identidade e Papel

O repositório provê configurações declarativas para o editor modal moderno **Helix** (`hx`), priorizando ergonomia modal (estilo Kakoune: seleção depois ação), tree-sitter integrado e zero dependência de plugins pesados.

---

## 📁 Estrutura Canônica de Arquivos

- **`config.toml`**: Tema visual (`dark_plus`), numeração relativa de linhas, formato de cursor e atalhos customizados de teclado.
- **`languages.toml`**: Configuração granular de indentação e formatadores por linguagem (`c`, `cpp`, `rust`, `zig`, `go`, `python`, `lua`, etc.).
- **`README.md`**: Guia institucional de instalação e atalhos.
- **`AGENTS.md`**: Briefing para agentes de IA.
- **`PRINCIPLES.md`**: Os 18 Princípios de Engenharia UNIX + Clean Code sincronizados.
- **`ENVIRONMENT.md`**: Manifesto do ecossistema sincronizado.

---

## ⚠️ Invariantes Críticas para Agentes de IA

1. **Sintaxe TOML Válida:** Todo arquivo `.toml` deve ser estritamente compatível com a especificação TOML v1.0.0. Valide sempre com `python3 -c "import tomllib; ..."`.
2. **Arquitetura de Comentários em 3 Camadas:** Mantenha cabeçalho de 64 `-` (`# ----...`), seções de 32 `=` (`### ====...`) e subseções de 32 `-` (`### ----...`).
3. **Fail-Safe Defaults:** Configurações de LSP e linters devem funcionar sem quebrar a edição básica de texto mesmo quando servidores LSP não estão no PATH.
4. **Zero Secrets:** Nunca incluir tokens ou segredos neste repositório.
5. **Hermetismo de Produção & Invariante `rm -rf .agents`:** Repositório 100% autônomo. Zero acoplamento de configurações a `.agents/` ou `skills/` (o Helix opera plenamente se `.agents/` for deletado).

---

---

## 🛡️ Regra da Proatividade e Correção Contínua (Boy Scout Rule)

O agente de IA **DEVE SER ATIVAMENTE PROATIVO** na manutenção e aplicação dos padrões canônicos deste repositório.

Se durante a execução de qualquer tarefa (seja criação de novas features, correções pontuais, refatorações ou investigação) o agente identificar qualquer linha de código, script, Makefile ou documentação fora dos padrões estabelecidos, **NÃO DEVE HESITAR NEM IGNORAR**:

1. **Notificar concisamente** o usuário sobre a divergência encontrada.
2. **Corrigir imediatamente a inconformidade**, aplicando o padrão canônico correspondente:
    - **Comentários Narrativos:** Eliminar imediatamente comentários óbvios que apenas narram código executável.
    - **Banners Estruturais:** Ajustar réguas para exatamente 64 hífens no topo ou 32 caracteres com `### ` no corpo.
    - **Portabilidade POSIX:** Substituir bashismos (`[[ ]]`, `&>`, arrays, `source`) por sintaxe estrita POSIX `/bin/sh`.
    - **Shebang Universal:** Garantir sempre `#!/usr/bin/env sh` ou `#!/usr/bin/env python3`.
    - **Sequências ANSI:** Substituir octais crípticos (``) e `printf` desnecessário por `[ -t 1 ] && echo -n $'\e...'`.
    - **Redirecionamento Seguro:** Envolver destinos em aspas duplas (ex: `> "/dev/null" 2>&1`).
    - **Makefiles:** Assegurar cabeçalho `.POSIX: .SILENT:`, `MAKEFLAGS += --no-print-directory -s`, alinhamento estético de variáveis e zero `@` redundante.
    - **Permissões Canônicas:** Aplicar 4 dígitos octais (`chmod 0755`, `chmod 0644`, `chmod 0700`, `chmod 0600`).

## 📖 Referências Obrigatórias

- **[ENVIRONMENT.md](ENVIRONMENT.md)**: Arquitetura global do ecossistema
- **[PRINCIPLES.md](PRINCIPLES.md)**: Os 18 Princípios de Engenharia UNIX + Clean Code
- **[.agents/rules/principles.md](.agents/rules/principles.md)**: Regras específicas para o Helix
- **[.agents/skills/](.agents/skills/)**: Runbooks operacionais do Helix

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
- **`PRINCIPLES.md`**: Os 22 Princípios de Engenharia UNIX + Clean Code sincronizados.
- **`ENVIRONMENT.md`**: Manifesto do ecossistema sincronizado.

---

## ⚠️ Invariantes Críticas para Agentes de IA

1. **Sintaxe TOML Válida:** Todo arquivo `.toml` deve ser estritamente compatível com a especificação TOML v1.0.0. Valide sempre com `python3 -c "import tomllib; ..."`.
2. **Arquitetura de Comentários em 3 Camadas:** Mantenha cabeçalho de 64 `-` (`# ----...`), seções de 32 `=` (`### ====...`) e subseções de 32 `-` (`### ----...`).
3. **Fail-Safe Defaults:** Configurações de LSP e linters devem funcionar sem quebrar a edição básica de texto mesmo quando servidores LSP não estão no PATH.
4. **Zero Secrets:** Nunca incluir tokens ou segredos neste repositório.
5. **Hermetismo de Produção & Invariante `rm -rf .agents`:** Repositório 100% autônomo. Zero acoplamento de configurações a `.agents/` ou `skills/` (o Helix opera plenamente se `.agents/` for deletado).
6. **Bancada de Desenvolvimento vs. Runtimes de Produção:** Em produção, o Helix reside e opera soberanamente em `~/.config/helix`. O repositório central `Environment` é exclusivamente uma bancada de desenvolvimento. NUNCA aponte symlinks no SO para `~/Documents/Environment/Editor/Helix`.
7. **Invariante de Clonagem "Out-of-the-Box" (Zero-Tweaks Git Invariant):** O Helix deve funcionar imediatamente após `git clone`. Modos octais no Git Index DEVEM ser rigorosamente `0755` para `helix.sh` e hooks, e `0644` para arquivos `.toml` e documentações.
8. **Governança de Roadmap (Opção C):** O repositório mantém seu [TODO.md](TODO.md) atualizado com a Matriz de Status e Backlog de Evolução, sincronizado com o badge no `README.md`.
9. **Refatoração Sem Legado / Soberania Monousuário (Clean-Break / Zero-Cruft Invariant):** O ecossistema é estritamente pessoal, governado e operado por um único desenvolvedor soberano (Gabriel Frigo). É terminantemente proibido manter "sujeira" de retrocompatibilidade, shims temporários, wrappers obsoletos, seções de compatibilidade legada ou aliases de transição ao renomear variáveis, comandos, funções, diretórios ou arquivos, salvo se expressamente ordenado pelo usuário. Toda refatoração deve ser atômica, direta, definitiva e limpa (_clean break_), expurgando o identificador antigo integralmente da base de código.

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
    - **Sequências ANSI & Escapes:** Eliminar terminantemente octais (`\033`, `\001`) para caracteres ou bytes. Usar `[ -t 1 ] && echo -n $'\e...'` para sequências de escape, notação hexadecimal (`\x01`, `\x1b`) para bytes/controles e fugir de `printf` desnecessário. Notação octal é estritamente aceita apenas onde o sistema operacional a exige nativamente (permissões POSIX: `chmod 0755`, `chmod 0644`, `umask`).
    - **Redirecionamento Seguro:** Envolver destinos em aspas duplas (ex: `> "/dev/null" 2>&1`).
    - **Makefiles:** Assegurar cabeçalho `.POSIX: .SILENT:`, `MAKEFLAGS += --no-print-directory -s`, alinhamento estético de variáveis e zero `@` redundante.
    - **Permissões Canônicas:** Aplicar 4 dígitos octais (`chmod 0755`, `chmod 0644`, `chmod 0700`, `chmod 0600`).
    - **Invariante Out-of-the-Box:** Garantir modos octais corretos no Git Index sem requerer intervenção manual pós-clone.
    - **Curadoria Cognitiva:** Capturar decisões estruturais e regras tácitas em skills locais compactas (`.agents/skills/`), mantendo-as atualizadas e expurgando runbooks obsoletos para evitar débito cognitivo, preservando sempre o hermetismo de produção (`rm -rf .agents`).
    - **Refatoração Sem Legado:** Expurgar sumariamente aliases obsoletos, variáveis mortas e shims de compatibilidade deixados para trás em renomeações passadas, mantendo o código puro e direto.

## 📖 Referências Obrigatórias

Antes de qualquer modificação neste ecossistema, consulte:

- **[ENVIRONMENT.md](ENVIRONMENT.md)**: Arquitetura global do ecossistema
- **[PRINCIPLES.md](PRINCIPLES.md)**: Os 22 Princípios de Engenharia UNIX + Clean Code
- **[TODO.md](TODO.md)**: Planejamento estratégico e matriz de status operacional
- **[.agents/rules/principles.md](.agents/rules/principles.md)**: Regras específicas para o Helix
- **[.agents/skills/](.agents/skills/)**: Runbooks operacionais do Helix

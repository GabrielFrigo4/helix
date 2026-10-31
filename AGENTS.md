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
- **`TODO.md`**: Roadmap e planejamento do editor.

---

## ⚠️ Invariantes Críticas para Agentes de IA

1. **Sintaxe TOML Válida:** Todo arquivo `.toml` deve ser estritamente compatível com a especificação TOML v1.0.0. Valide sempre com `python3 -c "import tomllib; ..."`.
2. **Taxonomia Tripartite de Comentários:** O código adota estritamente três categorias: 1. Comentários de Sistema = PERMITIDOS (shebangs, pragmas); 2. Comentários Estruturais de 64/32 colunas = PERMITIDOS (cabeçalhos de 64 `-`, seções de 32 caracteres `### ===`, réguas de 64 `=` em `.gitignore`, sem vazamento); 3. Comentários Explicativos/Narrativos = PROIBIDOS em código, configs E blocos de código dentro de Markdowns.
3. **Fail-Safe Defaults:** Configurações de LSP e linters devem funcionar sem quebrar a edição básica de texto mesmo quando servidores LSP não estão no PATH.
4. **Zero Secrets:** Nunca incluir tokens ou segredos neste repositório.
5. **Hermetismo de Produção & Invariante `rm -rf .agents`:** Repositório 100% autônomo. Zero acoplamento de configurações a `.agents/` ou `skills/` (o Helix opera plenamente se `.agents/` for deletado).
6. **Bancada de Desenvolvimento vs. Runtimes de Produção:** Em produção, o Helix reside e opera soberanamente em `~/.config/helix`. O repositório central `Environment` é exclusivamente uma bancada de desenvolvimento. NUNCA aponte symlinks no SO para `~/Documents/Environment/Editor/Helix`.
7. **Ciclo Canônico de Propagação & Banimento de Cópia Manual:** Toda alteração é testada na bancada (`make test`), comitada e enviada via Git. Clones de produção recebem atualizações exclusivamente via `git pull` mantendo a working tree limpa (Invariante Zero-Dirty).
8. **Invariante de Clonagem "Out-of-the-Box" (Zero-Tweaks Git Invariant):** O Helix deve funcionar imediatamente após `git clone`. Modos octais no Git Index DEVEM ser rigorosamente `0755` para `helix.sh` e hooks, e `0644` para arquivos `.toml` e documentações.
9. **Governança de Roadmap (TODO.md):** O repositório mantém seu [TODO.md](TODO.md) atualizado com a Matriz de Status e Backlog de Evolução, sincronizado com o badge no `README.md`.
10. **Refatoração Sem Legado / Soberania Monousuário (Clean-Break / Zero-Cruft Invariant):** O ecossistema é estritamente pessoal, governado e operado por um único desenvolvedor soberano (Gabriel Frigo). Evite manter resíduos de retrocompatibilidade, shims temporários, wrappers obsoletos, seções de compatibilidade legada ou aliases de transição ao renomear variáveis, comandos, funções, diretórios ou arquivos, salvo se expressamente ordenado pelo usuário. Toda refatoração deve ser atômica, direta, definitiva e limpa (_clean break_), expurgando o identificador antigo integralmente da base de código.
11. **Ergonomia de Cursor e Suíte Tri-Modal (PTY 24-Bit vs Raw TTY 16-Cores):** O Helix gerencia formatos via DECSCUSR em PTYs gráficos (`bar`, `block`, `underline`) com temas que definem scopes monocromáticos sem inversão de sintaxe (`ui.cursor.*`), e comuta no Raw TTY via wrapper `hx()` para `config-tty.toml` com tema `term16_dark` (`true-color = false`, cursor em bloco em software com tons 16-cores imune a anomalias cromáticas), garantindo auto-cura ao retornar ao shell (`_restore_tty_cursor`).
12. **Ambiente Híbrido Host/Guest (FreeBSD Workstation + Bhyve Linux Runtime):** Em estações FreeBSD, o agente de IA (`agy`) opera isolado dentro de uma máquina virtual Debian no Bhyve (`192.168.8.2`), conectada via NFSv3 à `/home/gabrielf` do host com paridade de UID/GID 1001. O agente executa comandos em ambiente Linux nativo (kernel 6.12/GNU), porém seus arquivos de trabalho residem fisicamente no ZFS do FreeBSD. Ao despachar comandos no terminal, utilize ferramentas Linux disponíveis no guest ou faça a demarcação correta ao editar scripts específicos de cada sistema operacional.
13. **Simetria de Escopo & Não-Assimetria de Subgrupo na Documentação:** Se um comportamento, protocolo ou invariante pertence a todo um grupo de componentes (ex: suíte de editores, shells suportados), documente-o no nível do grupo (documento de arquitetura, README do módulo pai ou especificação geral), evitando a criação de falsas assimetrias. Um sub-membro só deve receber documentação específica se implementar o comportamento de forma mais especializada, detalhada ou otimizada.

---

## 🛡️ Regra da Proatividade e Correção Contínua (Boy Scout Rule)

O agente de IA atua de forma proativa na manutenção e aplicação dos padrões canônicos deste repositório.

Ao identificar linhas ou artefatos fora dos padrões estabelecidos:

1. **Notificar concisamente** o usuário sobre o ajuste realizado.
2. **Corrigir a inconformidade**, aplicando o padrão correspondente:
    - **Taxonomia Tripartite de Comentários:** Eliminar comentários explicativos óbvios em código, configs e blocos de código em Markdowns, preservando exclusivamente comentários de sistema e delimitadores estruturais (64/32 colunas).
    - **Banners Estruturais:** Ajustar réguas para exatamente 64 hífens no topo ou 32 caracteres com `### ` no corpo (ou 64 `=` em `.gitignore`).
    - **Portabilidade POSIX:** Substituir bashismos (`[[ ]]`, `&>`, arrays, `source`) por sintaxe estrita POSIX `/bin/sh`.
    - **Shebang Universal:** Garantir sempre `#!/usr/bin/env sh` ou `#!/usr/bin/env python3`.
    - **Sequências ANSI & Escapes:** Não use octais (`\033`, `\001`) para caracteres ou escapes. Use `[ -t 1 ] && echo -n $'\e...'` ou notação hexadecimal (`\x01`, `\x1b`). Octal é exclusivo para permissões POSIX (`chmod 0755`, `chmod 0644`, `umask`).
    - **Redirecionamento Seguro:** Envolver destinos em aspas duplas (ex: `> "/dev/null" 2>&1`).
    - **Makefiles:** Assegurar cabeçalho `.POSIX: .SILENT:`, `MAKEFLAGS += --no-print-directory -s`, alinhamento estético de variáveis e zero `@` redundante.
    - **Permissões Canônicas:** Aplicar 4 dígitos octais (`chmod 0755`, `chmod 0644`, `chmod 0700`, `chmod 0600`).
    - **Invariante Out-of-the-Box:** Garantir modos octais corretos no Git Index sem requerer intervenção manual pós-clone.
    - **Emissão Semântica de UI:** Substituir `echo` avulsos com emojis pelas rotinas canônicas `_ui_*`.
    - **Antifragilidade & Resiliência:** Resolução ativa de caminhos em cascata, auto-cura de permissões (0600 em chaves/segredos) e validação defensiva de pré-requisitos.
    - **Curadoria Cognitiva:** Capturar decisões estruturais e regras tácitas em skills locais compactas (`.agents/skills/`), mantendo-as atualizadas e expurgando ruído obsoleto.
    - **Refatoração Sem Legado:** Expurgar aliases obsoletos, variáveis mortas e shims de compatibilidade em renomeações.
    - **Elevação Antifrágil & Shift Seguro:** Usar o bloco explícito `if [ "$(id -u)" -ne 0 ]` para resolução de `ELEVATE` (evitando término fatal sob `set -e` como root) e proteger todo comando `shift` com validação prévia de parâmetros (`[ "$#" -ge N ] && shift N`).
    - **Simetria de Documentação:** Mover regras ou invariantes universais documentadas erroneamente em sub-membros específicos para o documento de arquitetura do grupo correspondente, eliminando falsas assimetrias.

---

## 🚀 Comandos de Verificação Rápida (Quality Gates)

| Comando                         | Finalidade Operacional                                  |
| :------------------------------ | :------------------------------------------------------ |
| `make help`                     | Exibe o catálogo interativo de comandos disponíveis     |
| `make test` / `make check-toml` | Valida conformidade sintática estrita dos arquivos TOML |
| `make format`                   | Formata documentações e configurações com Prettier      |
| `make prettier`                 | Formata arquivos Markdown com Prettier                  |
| `make hooks`                    | Configura permissão `0755` nos ganchos de `.githooks/`  |
| `make ci`                       | Executa suite completa de integração contínua (`test`)  |

---

## 📖 Referências Obrigatórias

Antes de qualquer modificação neste ecossistema, consulte:

- **[ENVIRONMENT.md](ENVIRONMENT.md)**: Arquitetura global do ecossistema
- **[PRINCIPLES.md](PRINCIPLES.md)**: Os 22 Princípios de Engenharia UNIX + Clean Code
- **[TODO.md](TODO.md)**: Planejamento estratégico e matriz de status operacional
- **[.agents/rules/principles.md](.agents/rules/principles.md)**: Regras específicas para o Helix
- **[.agents/skills/](.agents/skills/)**: Runbooks operacionais do Helix

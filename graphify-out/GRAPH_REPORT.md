# Graph Report - workspace  (2026-11-17)

## Corpus Check
- cluster-only mode — file stats not available

## Summary
- 163 nodes · 173 edges · 15 communities (12 shown, 3 thin omitted)
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 1 edges (avg confidence: 0.85)
- Token cost: 579 input · 136 output

## Community Hubs (Navigation)
- Test Workflow Config
- Docker Setup
- Python Testing Utils
- CI Pipeline Config
- Knowledge Graph Concepts
- Test Coverage Workflow
- Package Update Workflow
- Project Documentation
- Pre-commit Hooks
- Unit Test Workflow
- Code Linting Workflow
- Trigger Conditions
- Vibe Session Management
- Coding Standards
- Package Template

## God Nodes (most connected - your core abstractions)
1. `with` - 14 edges
2. `ai` - 11 edges
3. `Writing Skills Skill` - 9 edges
4. `README` - 8 edges
5. `Wiki Index` - 7 edges
6. `steps` - 6 edges
7. `pytests` - 6 edges
8. `steps` - 6 edges
9. `pytests_cov` - 5 edges
10. `environment` - 5 edges

## Surprising Connections (you probably didn't know these)
- `test_hello_world()` --calls--> `hello_world()`  [INFERRED]
  tests/test_hello_world.py → src/eed_package_template/hello_world.py
- `Knowledge Graph Concept` --cites--> `Graphifyy`  [EXTRACTED]
  .vibe/skills/writing-skills/wiki/concepts/knowledge-graph-graphifyy.md → THIRD_PARTY_NOTICES.md
- `Writing Skills Skill` --references--> `Karpathy LLM Wiki Raw Source`  [EXTRACTED]
  .vibe/skills/writing-skills/SKILL.md → .vibe/skills/writing-skills/raw/karpathy-llm-wiki.md
- `Writing Skills Skill` --references--> `Vibe Skill Creator Raw Source`  [EXTRACTED]
  .vibe/skills/writing-skills/SKILL.md → .vibe/skills/writing-skills/raw/vibe-skill-creator-SKILL.md
- `Writing Skills Skill` --conceptually_related_to--> `Wiki Log`  [EXTRACTED]
  .vibe/skills/writing-skills/SKILL.md → .vibe/skills/writing-skills/wiki/log.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **LLM Wiki Pattern Components** — vibe_skills_writing_skills_skill, writing_skills_skill_raw_karpathy_llm_wiki, writing_skills_skill_wiki_index, writing_skills_skill_wiki_log, writing_skills_skill_wiki_concept_knowledge_graph, writing_skills_skill_wiki_concept_llm_wiki_pattern [EXTRACTED 0.95]
- **Vibe Skill Anatomy Components** — vibe_skills_writing_skills_skill, writing_skills_skill_raw_vibe_skill_creator, writing_skills_skill_wiki_concept_skill_anatomy, writing_skills_skill_wiki_source_vibe_skill_creator [EXTRACTED 0.95]

## Communities (15 total, 3 thin omitted)

### Community 0 - "Test Workflow Config"
Cohesion: 0.11
Nodes (23): steps, pytests_cov, steps, name, needs, runs-on, steps, steps (+15 more)

### Community 1 - "Docker Setup"
Cohesion: 0.10
Nodes (20): build, command, environment, init, ports, restart, stdin_open, tty (+12 more)

### Community 2 - "Python Testing Utils"
Cohesion: 0.14
Nodes (4): hello_world(), cfg_test(), test_hello_world(), test_package_import()

### Community 3 - "CI Pipeline Config"
Cohesion: 0.12
Nodes (16): name, outputs, runs-on, jobs, generate-parameters, lint, pytests, name (+8 more)

### Community 4 - "Knowledge Graph Concepts"
Cohesion: 0.22
Nodes (15): Third Party Notices, Graphify, Graphifyy, Vibe Skill Creator, Karpathy LLM Wiki, Writing Skills Skill, Karpathy LLM Wiki Raw Source, Vibe Skill Creator Raw Source (+7 more)

### Community 5 - "Test Coverage Workflow"
Cohesion: 0.13
Nodes (14): jobs, pytpytests_covests, name, on, workflow_dispatch, runs-on, steps, id (+6 more)

### Community 6 - "Package Update Workflow"
Cohesion: 0.18
Nodes (10): jobs, update_eed_basic_utils, name, on, workflow_dispatch, GH_PAT, secrets, uses (+2 more)

### Community 7 - "Project Documentation"
Cohesion: 0.22
Nodes (9): README, Development Container, GitHub Actions Workflows, LiteLLM, Local Windows Folders, Mistral Vibe, VS Code Tasks on Windows, EED GitHub Actions Workflows (+1 more)

### Community 8 - "Pre-commit Hooks"
Cohesion: 0.25
Nodes (7): args, id, types_or, repos, hooks, repo, rev

### Community 9 - "Unit Test Workflow"
Cohesion: 0.29
Nodes (6): jobs, pytests, name, on, workflow_dispatch, uses

### Community 10 - "Code Linting Workflow"
Cohesion: 0.29
Nodes (6): jobs, ruff, name, on, workflow_dispatch, uses

### Community 11 - "Trigger Conditions"
Cohesion: 0.33
Nodes (6): on, pull_request, push, workflow_dispatch, branches, branches

## Knowledge Gaps
- **14 isolated node(s):** `eed-package-template`, `eed_basic_utils`, `Coding Standards and Preferences`, `Third Party Notices`, `Karpathy LLM Wiki Raw Source` (+9 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 90 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `jobs` connect `CI Pipeline Config` to `Test Workflow Config`?**
  _High betweenness centrality (0.033) - this node is a cross-community bridge._
- **What connects `eed-package-template`, `eed_basic_utils`, `Coding Standards and Preferences` to the rest of the system?**
  _14 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Test Workflow Config` be split into smaller, more focused modules?**
  _Cohesion score 0.11067193675889328 - nodes in this community are weakly interconnected._
- **Why does `pytests` connect `CI Pipeline Config` to `Test Workflow Config`?**
  _High betweenness centrality (0.019) - this node is a cross-community bridge._
- **Should `Docker Setup` be split into smaller, more focused modules?**
  _Cohesion score 0.09523809523809523 - nodes in this community are weakly interconnected._
- **Should `Python Testing Utils` be split into smaller, more focused modules?**
  _Cohesion score 0.1437908496732026 - nodes in this community are weakly interconnected._
- **Should `CI Pipeline Config` be split into smaller, more focused modules?**
  _Cohesion score 0.11764705882352941 - nodes in this community are weakly interconnected._
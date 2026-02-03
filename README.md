#  🌐  Azure  Landing  Zone  –  Enterprise  Platform  Engineering  Blueprint

A  production-grade,  **Azure  Landing  Zone**  implementation  aligned  with:

-  Microsoft  **Cloud  Adoption  Framework  (CAF)**
-  **Enterprise-Scale  Landing  Zone**  architecture
-  Platform  engineering  best  practices

This  repository  defines  a  **reusable,  automated,  and  governed  Azure  platform**  with:

-  Management  group  hierarchy
-  Policy-as-code
-  Identity  and  access  model
-  Hub-and-spoke  networking
-  Logging,  monitoring,  and  security
-  Subscription  vending  and  environment  onboarding
-  CI/CD  pipelines  for  platform  and  environments

---

##  🧱  High-Level  Architecture

-  **Management  Groups**  for  org  structure  and  policy  inheritance
-  **Hub-and-Spoke  Network**  for  shared  services  and  isolation
-  **Centralized  Logging  &  Monitoring**  via  Log  Analytics  &  Sentinel
-  **Identity-Driven  Security**  using  AAD  groups,  RBAC,  and  Managed  Identities
-  **Platform  Automation**  for  subscription  vending  and  operations

---

##  📁  Repository  Structure

```text
azure-landing-zone-enterprise/
├──  docs/
├──  platform/
│      ├──  management-groups/
│      ├──  policy/
│      ├──  identity/
│      ├──  networking/
│      ├──  logging-monitoring/
│      └──  automation/
├──  environments/
│      ├──  dev/
│      ├──  staging/
│      └──  prod/
├──  pipelines/
├──  scripts/
└──  .pre-commit-config.yaml

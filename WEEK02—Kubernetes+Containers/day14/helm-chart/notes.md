
---

## 📝 **notes.md (your learning notes)**

```markdown
# Notes — Day 14 Helm

## Helm Charts
- Package Kubernetes apps.
- Include metadata, values, templates.
- Enable versioning and reuse.

## Values
- User-configurable settings.
- Injected into templates using `.Values.<key>`.
- Allow environment-specific overrides.

## Templating
- Go template engine.
- Supports functions, conditionals, loops.
- `_helpers.tpl` stores reusable template snippets.

## Benefits
- Standardized deployments.
- Easy upgrades and rollbacks.
- Works perfectly with GitOps (ArgoCD, Flux).
- Enables parameterized CI/CD pipelines.

## Key Takeaways
- Helm = Kubernetes package manager.
- Charts = reusable deployment units.
- Values = configuration.
- Templates = dynamic manifests.


# Love Lock — `lib/` layout

Feature-based architecture. Each top-level folder has a single responsibility:

| Folder | Responsibility |
|--------|----------------|
| **core/** | App-wide building blocks: theme, constants, shared widgets, utilities, and cross-cutting services (API, storage). |
| **features/** | Vertical slices by domain (`auth`, `dashboard`, `profile`). Each feature owns its UI, state, and data for that area. |
| **routes/** | Navigation configuration (`go_router`) and route path constants. |

### `core/` subfolders

- **constants/** — Static values: asset paths, copy, spacing, radii.
- **theme/** — Colors, typography, and `ThemeData` for the whole app.
- **services/** — Singletons and clients (HTTP, analytics, secure storage).
- **utils/** — Pure helpers with no UI (formatters, validators).
- **widgets/** — Reusable UI used across multiple features.

### `features/` subfolders (per feature)

- **screens/** — Full-page route destinations.
- **widgets/** — UI private to that feature.
- **models/** — Data classes / DTOs.
- **providers/** — Riverpod state and controllers.
- **repositories/** — Data access; calls services and maps to models.

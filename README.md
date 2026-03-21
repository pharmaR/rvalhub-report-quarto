# R Validation Hub Report Quarto Extension

## Quick Start

### Calculate & Render {.metrics-render-time}

> [!WARNING]
> Work-in-progress
>
> This method is more error prone until we make the template more resilient to
> metrics which errored or did not necessary permissions granted for calculation

> [!IMPORTANT]
> This method is easiest to get started, but hardest to debug and ensure good
> reproducibility.
>
> Looking for reproducibility? Head to (the section on using pre-calculated
> metrics)[#metrics-precalculated].

If we pass a package name to quarto parameter `package` the template will derive
metrics during the report generation as they are needed.

This is equivalent to `val.meter::pkg(params$package)`, and comes with all the
caveats associated with that. The package will be sourced from your
local library or default package repositories.

If we want to pass extra options, such as permitting `val.meter` to execute
package code, we need to pass those options through quarto as well:

```sh
quarto render \
  -P package=praise \
  -P options='val.meter.policy: "!expr val.meter::policy(permissions = TRUE)"'
```

_or using the `quarto` R package_

```r
quarto::quarto_render(
    
)
```

### Precalculated Metrics {.metrics-precalculated}

By precalculating metrics, we can derive all the inputs for our report outside
the actual reporting engine. This can make it far easier to control the
execution environment and can be much easier to debug.

```r
library(val.meter)

options(
  # constrain console output width for cleaner logs
  width = 80L,
  # enable logs for richer reports
  val.meter.logs = TRUE,
  # opt-in to more permissions to gather more metrics
  val.meter.policy = policy(permissions = TRUE)
)

# derive our package metrics
p <- pkg("../val.meter")
metrics(p)

saveRDS(p, "metrics.Rds")
```

```sh
quarto render -P package=metrics.Rds
```

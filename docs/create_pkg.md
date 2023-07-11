# Creating a Package/Module

1. Go into the package mode by typing `]` in the cmd.
2. Enter `generate <your-pkg-name>` to create the pkg.

Successfully created a pkg project.

> The items in the module needs to be exported before it can be imported in other files.

To use it,

1. (if needed) Configure `LOAD_PATH` to point to the pkg dir.
   ```
   push!(LOAD_PATH, "/your/pkg/parent/directory")
   ```
2. use the `using <your-pkg-name>` on top of the referencing file.

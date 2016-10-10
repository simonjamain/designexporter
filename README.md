# Presentation
*design exporter* is a tool created in order to improve graphic design exportation workflow in terms of speed and reliability.
It aims to be very flexible so functionnalities (plugins) can be written in any language you want (ruby me like).
The tool can also be used to launch other batch processing stuff.

## The case study
As a creative agency we have one folder for each **client**.
For each client we have a folder containing all the graphic work and **sources** lets call it **graphics**.

Each client also have what we call a **communication kit** containning the exploitable assets such as the **graphical charter**, **logos** in multiple sizes and extensions, **fonts** files, **photos** and so on.

Finaly, the general **information** of each clients (mostly textual) are stored in a separate folder.

Here is what it migth look like :

```ASCII
Clients
|-- Client 1
|   |-- Information
|   |   `-- texts, sheets and stuff...
|   |-- Graphics
|   |   `-- sources and stuff...
|   `-- Communication Kit
|       |-- graphical charter.pdf
|       |-- Logos
|       |   |-- main logo HQ.png
|       |   `-- main logo HQ.jpg
|       |-- Fonts
|       |   |-- main font.otf
|       |   `-- secondary font.otf
|       `-- Photos
etc...
```

The idea is that the **communication kit** contains mostly exported/generated stuff. We don't want to manually export assets and just run a single file (by us or cron/incron) that do everything for us.
That's where this tool came from.

## Usage

Design exporter is a plugin-based script.
There is one main config file written in yaml that allow you to set **rules** for any specified folder pattern (set with a regular expression).

### Dependencies

  TODO
### Main config file

A **rule** define an action that will be executed by a **plugin** with given **options**.
A set of **rules** is executed once for each path present in a **root** folder matching a given regular expression (**matchSet**).

Here is the structure of the main config file. The **options** value list is plugin-specific and it is defined in their ```plugin.yml``` file.
```yaml
root: ../../clients
matchSet: (?!^model client$) # match all folders except the one nammed 'model client'
rules:
    - plugin: pluginName
      options:
          - option1: value1
          - optionN: valueN
    - plugin: pluginName
      options:
          - option1: value1
          - optionN: valueN
---
root: /var/curriculums
matchSet: (?!^model client$) # match all folders except the one nammed 'model client'
rules:
    plugin: pluginName
    options:
        - option1: value1
        - optionN: valueN
```

### writing plugins

A plugin is defined by a folder containing a yaml file which define basic mandatory information : an unique **name**, a **descritption**, a list of required plugins (**dependencies**), a list of **options** (arguments) needed by the plugin and finally a **command** to execute (arguments will be passed).

 with the following structure :

```yaml
name: pluginName
description: quick description
dependencies:
 - plugin1 # plugin1 is needed to work
 - pluginN # pluginN is needed to work
options:
 - option1 # option description
 - optionN # option description
command: shell command to execute
```

Hence the simplest plugin would be :

```yaml
name: helloWorld
description: A plugin to say hello to the world
options: []
command: echo "hello world"
```

And that's it.

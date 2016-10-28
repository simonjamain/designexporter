# Presentation
*design exporter* is a tool created in order to improve graphic design exportation workflow in terms of speed and reliability.
It aims to be very flexible and easiily extendable, new functionnalities (plugins) can be written in any language you want (ruby me like).
The tool can also be used to launch other batch processing stuff.

## The case study
As a creative agency we have one folder for each **client**. It contains all the related graphic work and **sources**, let's call it **graphics**.

Each client also have what we call a **communication kit** containning the exploitable assets such as the **graphical charter**, **logos** in multiple sizes and extensions, **fonts** files, **photos** and so on.

Finaly, the general **information** of each client (mostly textual) is stored in a separate folder.

Here is what it look like :

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

That's where the idea of this tool came from.

# Use

*design exporter* is a plugin-based script.
There is one main configuration file written in yaml that allows you to set **rules** for any specified folder pattern according to a regular expression.

## Dependencies

  TODO
## Main config file
The main configuration file consists of sets of user defined rules :

A **rule** defines an action that will be executed by a **plugin** with given **options**.

A set of **rules** is executed once for each folder present in a **root** folder matching a given regular expression (**folders**).

Here is the structure of the main config file. The **arguments** value is plugin-specific.
```yaml
  -
    root: ../../clients
    folders: ^(?!model client$).* # match all folders except the one nammed 'model client'
    rules:
        - plugin: pluginName
          arguments: arguments
        - plugin: pluginName
          arguments: arguments
  -
    root: /var/curriculums
    folders: ^(?!model client$).* # match all folders except the one nammed 'model client'
    rules:
        plugin: pluginName
        arguments: arguments
```

## writing plugins

A plugin is defined by a folder containing a ```main``` executable file.
The **name** of the plugin is the name of its folder.

And that's it.

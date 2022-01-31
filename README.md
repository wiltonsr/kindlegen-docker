# Kindlegen Docker

Since [KindleGen is no longer available for download](https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211), this Docker Image is based on a version web archived [here](https://archive.org/download/kindlegen2.9/kindlegen_linux_2.6_i386_v2_9.tar.gz).

## Usage

### Running

The container has `kindlegen` binary as default [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint). So just run:

```bash
docker run wiltonsr/kindlegen
```

And you will get the following output:

```text
*************************************************************
 Amazon kindlegen(Linux) V2.9 build 1028-0897292
 A command line e-book compiler
 Copyright Amazon.com and its Affiliates 2014
*************************************************************

Usage : kindlegen [filename.opf/.htm/.html/.epub/.zip or directory] [-c0 or -c1 or c2] [-verbose] [-western] [-o <file name>]
Note:
   zip formats are supported for XMDF and FB2 sources
   directory formats are supported for XMDF sources
Options:
   -c0: no compression
   -c1: standard DOC compression
   -c2: Kindle huffdic compression
   -o <file name>: Specifies the output file name. Output file will be created in the same directory as that of input file. <file name> should not contain directory path.
   -verbose: provides more information during ebook conversion
   -western: force build of Windows-1252 book
   -releasenotes: display release notes
   -gif: images are converted to GIF format (no JPEG in the book)
   -locale <locale option> : To display messages in selected language
      en: English
      de: German
      fr: French
      it: Italian
      es: Spanish
      zh: Chinese
      ja: Japanese
      pt: Portuguese
      ru: Russian
      nl: Dutch
```

### Running with Volume

The container uses the `/source` directory as [WORKDIR](https://docs.docker.com/engine/reference/builder/#workdir) and `kindlegen` will always run from this location. It can be mapped for use with relative file paths to pass parameters and input files to `kindlegen`:

```bash
# pwd
# /my/dir

# ls -l /my/dir
# input.epub

docker run \
  -v $(pwd):/source \
  wiltonsr/kindlegen input.epub -o output.mobi

# ls -l /my/dir
# input.epub
# output.mobi
```

### Running and Maintaining Permissions

By default, the container runs as the `root` user. This makes the generated files also have `root` user permission. To avoid this behavior it is possible to override the `USER` instruction by passing the [--user](https://docs.docker.com/engine/reference/run/#user) option.

```bash
docker run \
  --user $(id -u):$(id -g) \
  -v $(pwd):/source \
  wiltonsr/kindlegen input.epub -o output.mobi
```
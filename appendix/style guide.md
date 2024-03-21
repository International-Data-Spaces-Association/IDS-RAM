# GitHub Style Guide


## Please note


In some instances there may be different possibilities to format what is described here. To ensure a continuous formatting throughout the repository / file, **please use the manner that is described in this file.**

## Basics
### Lines

In Markdown, making a line space with `enter`, only translates to one line break, no matter how many are in the code.

````
The quick

brown fox

jumps over the lazy dog.
````

translates to:

The quick 

brown fox jumps 

over the lazy dog.
````
The quick 



brown fox jumps 



over the lazy dog.
````

stays the same.

If you only use `enter` to get to another line, this will not translate and all stay in the same line:
````
The quick 
brown fox jumps 
over the lazy dog.
````
The quick 
brown fox jumps 
over the lazy dog

### Highlighting

Highlighting can be done in two ways, either _italic_ or **bold** font. This is archived by putting it `_` for `_italic_` or `**` for `**bold**`.

If you want to bring something to the readers attention, like a disclaimer, you can use this:

````
> information
>
> important information

````

> information headline
>
> important information

If you want to format it you can use `[!Note]` or `[!Warning]`
which will be shown as:

>[!Note]
>important note

>[!Warning]
>Imortant Warning

(For this you do not need an extra empty row to go into the next one)

## Headings

### Sizes 

Headings have four relevant sizes:

# Heading 1
## Heading 2
### Heading 3
#### Heading 4

You can use them like this:
````
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
````

The formatting with the `#` will only work with a space between the `#` and the first letter, and will put everything in it's line into the heading. Heading 1 and 2 will generate a line under the text. Please make sure to start your heading at the start of the line.

### Heading Order

Headings should always decrease by one level:

|order| correct | incorrect |
|---------|----------|---|
|  1   |`# big topic 1` | `# big topic 1`
|  2  |`## 2nd subtopic 1` | `### 3rd subtopic 1`

In contrast, headings' sizes can jump up multiple levels, e.g. when the topic changes:

|order| correct |
|---------|----------|
|  1   |`#### 4th subtopic 1` |
|  2  |`## big topic 2` | 

---

## Lists

### Unordered List Style 

Although, there are multiple possibilities to format the same kind of unordered list, in this repository we only use one:
````
- point one
- point two
````
which will look like this:

- point one
- point two

Please take care, that there has to be a space between `-` and the text.

#### Indentation

To create sub-points in your unordered list, you can indent the points with `tab`:
````
 - point 1.0
	- point  1.1
	- point 1.2
		- point 1.2.1
````
Which will look like this:
- point 1.0
	- point  1.1
	- point 1.2	
		- point 1.2.1

Please take care to use `tab` to indent **do not** use `space`, as this will not create an indent.
 The following is **incorrect**:
````
- point 1.0
-  point 1.1
````
or
````
- point 1.0
 - point 1.1
````
resulting in:
- point 1.0
-  point 1.1

or 

- point 1.0
 - point 1.1

### Ordered Lists Style

Ordered lists can be used in the style of a numbered list:
````
1. first Point
2. second point
3. third point
````

showing as:

1. first Point
2. second point
3. third point

Please take care, that there has to be a space between `.` and the text.

#### Indentation

If you have something to add to the counted point, please **do not** indent the numbered list, this will not work:

````
1. one
	2. sub-one
2. two
````

1. one
	2. sub-one
3. two

Instead, you can indent an unsorted list:
````
1. one
	- sub-one
2. two
````

1. one
	- sub-one
2. two

Or leave the list formatting out:
````
1. one

	sub-one
2. two
````
1. one
   
	sub-one
3. two

## Links

### Internet

To add Internet Links do this:
````
[Text that is shown](URL)
````
e.g:
````
[International Data Spaces Homepage](https://internationaldataspaces.org/)
````

This will be shown as:

[Text that is shown](URL)

e.g:

[International Data Spaces Homepage](https://internationaldataspaces.org/)

### Mail

To add a Mailing link, that opens a new mail to a receiver do this:

````
[Name](mailto:[mail@example.com])
````
e.g:
````
[IDSA Head Office](mailto:[info@internationaldataspaces.org])
````

[Name](mailto:[mail@example.com])

e.g:

[IDSA Head Office](mailto:[info@internationaldataspaces.org])

## Graphic

### Media / Pictures

Media is added similar to links, only the part in `()` is not a URL, but the path it takes to get to the picture file.

````
![Text displayed if the image doesn't work](path/to/image)
````
e.g.
````
![Data Sharing in a Data Space](images/IDSA-Infographic-Data-Sharing-in-a-Data-Space.jpg)
````

Here, the markdown file using this picture is in the Same file, as the `images` file, the pictures name is `IDSA-Infographic-Data-Sharing-in-a-Data-Space.jpg`.

In this Repository the `media` file stores the images, it is located in the `appendix`.

If you want to use images stored there, but your markdown document is in a different sub-file of the repository, you will have to use `.`.

For example:

Your picture, `picture.png`, is in the `media` file is in the `appendix` file, which is in the main file / landing page.

(main>appendix>media>picture.png)

The markdown you are writing is in file A, which is in file B, which in turn is in the main file.

(main>B>A)

Then you will have to use `.` to direct the path back into the main file and from there to your image:

````
![Text displayed if the image doesn't work](../appendix/media/picture.png)
````
e.g.
````
![ Three types of activities of the International Data Spaces (../media/image10.png)
````

Here each `.` goes out of one file, into the one it is in. 
Please not that `../` does **not** have any spaces.

### Tables

Tables are done the following:

````
| A | B | C |
|--|---|---|
|D | E | F |
````

resulting in:

| A | B | C |
|--|---|---|
|D | E | F |

It does not matter how many rows or columns are needed.

There have to be `|` before the first, and after every entry of a row.

After the first row, which contains the headlines, you have to make one row with `|--|`, it does not matter how many `--` are between the lines, it just has to be the same amount of columns in every row.

After that, you can go on with `|text|` as many rows as needed.

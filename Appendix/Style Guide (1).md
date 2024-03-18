# GitHub Style Guide


## Please note


In some instances there may be different possibilities to format what is described here. To ensure a continuous formatting throughout the repository / file, **please use the manner that is described in this file.**

## Basics
### Lines and Spaces

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
or
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


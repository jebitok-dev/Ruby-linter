![](https://img.shields.io/badge/Microverse-blueviolet)

## Ruby-linter

> Build a CSS linter as a Ruby Capstone Project for Ruby module. The linter checks css file incase of such errors: for Extra/Unnecessary empty lines,
	Indentation(2 spaces), and Last Empty Line Space before bracket.

## Installation

### How to Set-Up
- Install Ruby
````
$ ruby -v
$ gem install ruby
````
- Set-Up the project locally
````
- $ git clone https://github.com/jebitok-dev/Ruby-linter
- $ git checkout develop
- Delete gemlock file
- run ```$ bundle```
````

## How to Use

Open the folder you want to check on your terminal and type the following command!

```bash
Test for good file ruby ./bin/markup.rb lib/good.css

or

Test for bad file ruby ./bin/markup.rb lib/bad.css
```

---

## Built With

- Ruby
- Ruby-Rubocop
- Github
- RSpec for Testing

---

## Features

In this version release, we will check the following issues:

	- Extra/Unnecessary empty lines.
	- Indentations (By Default and as far, for now, it will check indentations of 2).
	- Last Empty Line.
	- Space before bracket.
---

## Error List & Examples

- ### Space Before Bracket

	Bad Code
	
	```css 
	1	body{
	2	  width: 101px;
	3	}
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	```

- ### Indentation

	Bad Code
	
	```css 
	1	body {
	2			width: 101px;
	3	}
	```

	or

	```css 
	1	body {
	2	width: 101px;
	3	}
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	```


- ### Trailing Space

	Bad Code

	```css
	1	body {
	2	  width: 101px;
	3	} 

	4	section {
	5	  height: 300px;
	6	} 
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	5	section {
	6	  height: 300px;
	7	}
	8
	```
- ### Mising Last Line

	Bad Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	5	section {
	6	  height: 300px;
	7	}

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	5	section {
	6	  height: 300px;
	7	}
	8
	```
### Run tests
Open the terminal and checkout the parent project folder and run:
````
$ rspec
````
### Author

👤 **Sharon Jebitok**

- GitHub: [@Jebitok-dev](https://github.com/jebitok-dev)
- Twitter: [@Jsebitok](https://twitter.com/jsebitok)
- LinkedIn: [LinkedIn](https://linkedin.com/in/sharon-jebitok/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

### How to Contribute

To get a local copy up and running follow these simple example steps.
````
- Fork the repository
- git clone https://github.com/your_username/Ruby-linter
- git checkout develop
- git checkout -b branch name
- Delete gemlock file
- run ```$ bundle```
- git remote add upstream https://github.com/jebitok-dev/Ruby-linter
- git pull upstream develop
- git commit -m "commit message"
- git push -u origin HEAD
````

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Inspired by [Microverse](https://microverse.org/)


## 📝 License

This project is [MIT](https://mit-license.org/) licensed.

# Jogi

Command line tool for getting information of images and videos. (like image size, video length, etc...)

## Usage

### Get image sizes

```sh
$ jogi size ~/Pictures/hoge/
[
	{
		"name": "hoge.jpg",
		"width": 128,
		"height": 128
	},
	{
		"name": "huga.png",
		"width": 256,
		"height": 512
	}
]
```

### Get video lengths

```sh
$ jogi length ~/Pictures/hoge/
[
	{
		"name": "hoge.mp4",
		"length": "02:13"
	},
	{
		"name": "huga.mov",
		"length": "01:00"
	}
]
```

### Set output format

```sh
$ jogi size -f yaml ~/Pictures/hoge/
- name: hoge.jpg
  width: 128
  height: 128
- name: huga.png
  width: 256
  height: 512
```

~/.jogirc

```ruby
format :yaml # Set default output format
```

## Status
WIP

## Author
syumai

## License
MIT

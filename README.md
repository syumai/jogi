# Jogi

Command line tool for getting information of images and videos. (like image size, video duration, etc...)

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

### Get video durations

```sh
$ jogi duration ~/Movies/hoge/
[
	{
		"name": "hoge.mp4",
		"duration": "02:13"
	},
	{
		"name": "huga.mov",
		"duration": "01:00"
	}
]
```

### Set output format

```sh
$ jogi size --yaml ~/Pictures/hoge/
- name: hoge.jpg
  width: 128
  height: 128
- name: huga.png
  width: 256
  height: 512
```

### Set default configurations (WIP)

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

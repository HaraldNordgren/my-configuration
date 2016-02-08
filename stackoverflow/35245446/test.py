    #!/usr/bin/env python3

    txt_file = "scores.txt"
    lines = open(txt_file, 'r').readlines()

    name = "bob"
    score = 10

    with open(txt_file,'w') as f:
      for line in lines:
        if name not in line:
          f.write(line)
        elif name in line:
          strings = line.split(',')
          strings.insert(-1, score)
          output = ",".join(str(s) for s in strings)
          f.write(output)
import sys
import csv
import re

categories_file = sys.argv[1]
expenses_file = sys.argv[2]
existing_categories = dict()
new_categories = dict()

with open(categories_file) as categories_csv:
    categories_reader = csv.reader(categories_csv, delimiter=';', quotechar='"')
    next(categories_reader)  # Skips header
    for row in categories_reader:
        existing_categories[row[0]] = 1
with open(expenses_file, encoding='iso-8859-1') as expenses_csv:
    expenses_reader = csv.reader(expenses_csv, delimiter=';', quotechar='"')
    for row in expenses_reader:
        if len(row) >= 5 and re.match('.\d*\.?\d+,\d+', row[5]):
            new_categories[row[2]] = 1
f = open(categories_file, 'a')
new_categories_count = 0
for new_category in new_categories.keys():
    if new_category and new_category not in existing_categories:
        new_categories_count += 1
        f.write('{};;\n'.format(new_category))
print('Added {} categories to {}'.format(new_categories_count, categories_file))

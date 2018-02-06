import sys
import csv
import re
import logging
import datetime
import xlsxwriter

class Expense:
    def __init__(self):
        self.name = ""
        self.value = float()
        self.date = datetime.date(1900, 1, 1)
        self.desc = ""
categories = dict()
expenses = []
months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
month_names = ['NA', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dic']
categories_file = sys.argv[1]
expenses_file = sys.argv[2]

logging.basicConfig(filename='expenses_analysis.log', filemode='w', format='%(asctime)s %(levelname)s %(message)s', level=logging.DEBUG)

with open(categories_file) as categories_csv:
    categories_reader = csv.reader(categories_csv, delimiter=';', quotechar='"')
    next(categories_reader) # Skips header
    for row in categories_reader:
        categories[row[0].strip()] = row[1]
    for item in categories:
        logging.info("item '%s', category '%s'", item, categories[item])
with open(expenses_file, encoding='iso-8859-1') as expenses_csv:
    expenses_reader = csv.reader(expenses_csv, delimiter=';', quotechar='"')
    for row in expenses_reader:
        if len(row) >= 5 and re.match('.\d*\.?\d+,\d+', row[5]):
            expense = Expense()
            expense.name = row[2].strip()
            value = row[5].replace('.', '')
            value = value.replace(',', '.')
            expense.value = float(value)
            date_split = row[0].split('.')
            expense.date = datetime.date(int(date_split[2]), int(date_split[1]), int(date_split[0]))
            expense.desc = row[4]
            expenses.append(expense)
        else:
            logging.warning("Skipped line:%s", row)

workbook = xlsxwriter.Workbook('expenses.xlsx')
for month_num in months:
    worksheet = workbook.add_worksheet()
    worksheet.name = month_names[month_num]
    row = 0
    col = 0
    # Report mode!
    res_by_category = dict()
    for expense in expenses:
        if expense.name in categories:
            category = categories[expense.name]
        else:
            category = 'NA'
            logging.warning("Expense '%s' not found in categories file", expense.name)
        if expense.date.month == month_num:
            if category in res_by_category:
                res_by_category[category] += expense.value
            else:
                res_by_category[category] = expense.value
    for key in res_by_category.keys():
        worksheet.write(row, col, key)
        worksheet.write(row, col + 1, format(round(res_by_category[key], 2), '.2f'))
        row += 1
    # Detail mode!
    row += 2
    categories_names = {}
    for v in categories.values():
        categories_names[v] = 1
    for category_name in categories_names.keys():
        for expense in expenses:
            if expense.name and categories[expense.name] == category_name:
                if expense.date.month == month_num:
                    worksheet.write(row, col, category_name)
                    worksheet.write(row, col + 1, expense.name)
                    worksheet.write(row, col + 2, format(round(expense.value, 2), '.2f'))
                    worksheet.write(row, col + 3, expense.desc)
                    row += 1
workbook.close()

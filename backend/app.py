from flask import Flask, request, jsonify
from flask_cors import CORS
import os 

import psycopg2

app = Flask(__name__)
CORS(app)

conn = psycopg2.connect(
    host = 'db',
    port = 5432,
    user = "admin",
    password = "admin",
    database = "compost",
)


@app.route('/', methods=['GET'])
def select_all():

    cur = conn.cursor()
    cur.execute('SELECT * FROM iot_data')
    sql_result = cur.fetchall()

    result = []

    for item in sql_result :
        index = item[0]
        title = item[1]
        category = item[2]
        content = item[3]

        res = {}
        for idx, val in enumerate(item):
            res[idx] = val

        result.append(res)#dict(index=index, title=title, category=category, content=content))

        return jsonify(data=result[0])
    #return jsonify(data=result)

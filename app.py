from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/all-teams', methods=['POST'])
def all_teams():
    request_data = request.get_json()
    return jsonify(request_data)

if __name__ == '__main__':
    app.run(debug=False, port=5000)
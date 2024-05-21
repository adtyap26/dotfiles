import os


def parse_latency_file(file_path):
    with open(file_path, "r") as file:
        lines = file.readlines()
        data = []
        for line in lines:
            if line.startswith("Start:"):
                data.append({"start_time": line.split()[1]})
            elif line.startswith("HOST"):
                # Assuming that data is tab-separated
                fields = line.split()
                data.append(
                    {
                        "host": fields[1],
                        "loss_percent": fields[3],
                        "snt": fields[5],
                        "last": fields[7],
                        "avg": fields[8],
                        "best": fields[9],
                        "wrst": fields[10],
                        "stdev": fields[11],
                    }
                )
        return data


def parse_latency_directory(directory):
    parsed_data = {}
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".txt"):
                file_path = os.path.join(root, file)
                parsed_data[file_path] = parse_latency_file(file_path)
    return parsed_data


directory_path = "path_to_your_directory"
output_file = "latency_summary.txt"

parsed_data = parse_latency_directory(directory_path)
with open(output_file, "w") as f:
    for file_path, data in parsed_data.items():
        f.write(f"File: {file_path}\n")
        for entry in data:
            if "start_time" in entry:
                f.write(f"Start Time: {entry['start_time']}\n")
            else:
                f.write(
                    f"Host: {entry['host']}, Loss%: {entry['loss_percent']}, Last: {entry['last']}, "
                    f"Avg: {entry['avg']}, Best: {entry['best']}, Wrst: {entry['wrst']}, StDev: {entry['stdev']}\n"
                )

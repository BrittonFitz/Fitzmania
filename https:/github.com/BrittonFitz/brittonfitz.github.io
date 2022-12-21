import matplotlib.pyplot as plt
import tkinter as tk
import plotly.graph_objects as go

# Create the GUI
root = tk.Tk()
root.title('Election Result Graphics')

# Add input fields for the candidates and votes
candidate_label = tk.Label(root, text='Candidates:')
candidate_label.pack()
candidate_entry = tk.Entry(root)
candidate_entry.pack()
vote_label = tk.Label(root, text='Votes:')
vote_label.pack()
vote_entry = tk.Entry(root)
vote_entry.pack()

# Add a button to generate the chart
def generate_chart():
    # Get the input data from the entry fields
    candidates = candidate_entry.get().split(',')
    votes = list(map(int, vote_entry.get().split(',')))

    # Create the bar chart using plotly
    fig = go.Figure(data=[go.Bar(x=candidates, y=votes)])
    fig.update_layout(title='Election Results', yaxis_title='Number of Votes')

    # Generate an HTML file that displays the chart
    fig.write_html('chart.html')

button = tk.Button(root, text='Generate Chart', command=generate_chart)
button.pack()

# Run the GUI
if __name__ == '__main__':
    root.mainloop()

<iframe src="chart.html" width="600" height="400"></iframe>

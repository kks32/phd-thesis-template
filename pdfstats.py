#!/usr/bin/env python
import datetime
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import pandas as pd


def main():
    # Load data in from .stats file
    df = pd.read_csv("thesis.pdf.stats", delimiter=" ")
    #
    df['date-nice'] = pd.to_datetime(df['date'], unit='s')
    print(df)
    # Plot!
    fig, ax = plt.subplots(figsize=(8,6))
    ax.plot(df['date-nice'], df['pages'], label='Pages')
    ax.plot(df['date-nice'], df['words']/1000, label='Words/1000')
    ax.plot(df['date-nice'], df['filesize']/1e6, label='File Size [MB]')
    ax.grid(True)
    ax.set_ylim(0, 1.1*np.max(df['pages']))
    ax.set_xlabel("Date")
    ax.set_xlim(datetime.date(2023,1,1), datetime.date(2023,2,1))
    ax.xaxis.set_major_formatter(mdates.ConciseDateFormatter(ax.xaxis.get_major_locator()))
    plt.legend()
    plt.show()

if __name__ == '__main__':
    main()

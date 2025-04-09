import streamlit as st
import pandas as pd
import numpy as np

st.title("Simple Streamlit App")

st.write("## Data Visualization Demo")

chart_data = pd.DataFrame(
    np.random.randn(20,3),
    columns=['A','B','C'])

st.line_chart(chart_data)

number = st.slider('Select a number', 0, 100, 50)
st.write(f'You selected: {number}')

user_input = st.text_input('Enter some text')

if user_input:
    st.write(f'You entered: {user_input}')

    
import sys
st.write(f"Running on  Python {sys.version}")
import React, { useContext } from 'react';
import { ThemeContext } from './ThemeContext';

function ThemedButton() {
  const { theme, toggleTheme } = useContext(ThemeContext);
  const style = {
    backgroundColor: theme === 'light' ? '#EEE' : '#333',
    color: theme === 'light' ? '#000' : '#FFF',
    padding: '0.5em 1em',
    border: 'none',
    cursor: 'pointer'
  };

  return (
    <button style={style} onClick={toggleTheme}>
      Current theme: {theme}
    </button>
  );
}

export default ThemedButton;

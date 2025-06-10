import React, { useState } from 'react';

const NameForm = () => {
  const [name, setName] = useState('');

  return (
    <form>
      <input
        value={name}
        onChange={e => setName(e.target.value)}
        placeholder="Enter your name"
      />
      <p>Your name is: {name}</p>
    </form>
  );
};

export default NameForm;

import React from 'react';
import PropTypes from 'prop-types';

function UserProfile({ user, showDetails }) {
  return (
    <div>
      <h2>{user.name}</h2>
      {showDetails && <p>Email: {user.email}</p>}
    </div>
  );
}

UserProfile.propTypes = {
  user: PropTypes.shape({
    name: PropTypes.string.isRequired,
    email: PropTypes.string,
  }).isRequired,
  showDetails: PropTypes.bool,
};

UserProfile.defaultProps = {
  showDetails: false,
};

export default UserProfile;

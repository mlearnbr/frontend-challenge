import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/Star_Wars-Logo.wine.svg';
import './Navbar.css';

function Navbar() {
  return (
    <div className="header">
      <Link to="/">
        <img src={logo} alt="star wars logo" />
      </Link>
    </div>
  );
}
export default Navbar;

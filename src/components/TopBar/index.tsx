import React from 'react';
import { NavLink } from 'react-router-dom';

import logo from 'assets/images/logo.png';
import './topbar.css';

export default function TopBar() {
  return (
    <div id="topbar">
      <div className="container">
        <NavLink to="/">
          <figure id="topbar__logo">
            <img src={logo} alt="Star Wars logo" />
          </figure>
        </NavLink>
      </div>
    </div>
  )
}

import React from 'react';

import logo from 'assets/images/logo.png';
import './topbar.css';

export default function TopBar() {
  return (
    <div id="topbar">
      <div className="container">
        <figure id="topbar__logo">
          <img src={logo} alt="Star Wars logo" />
        </figure>
      </div>
    </div>
  )
}

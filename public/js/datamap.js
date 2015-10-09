var map = new Datamap({
  element: document.getElementById('map-container'),
  fills: { 
    TW: 'rgba(3,151,179,0.72)', 
    defaultFill: 'rgba(2,206,116,0.6)'
  },
  data: {
    USA: { fillKey: 'TW'},
    CAN: { fillKey: 'TW'},
    BRA: { fillKey: 'TW'},
    GBR: { fillKey: 'TW'},
    DEU: { fillKey: 'TW'}, 
    ZAF: { fillKey: 'TW'}, 
    IND: { fillKey: 'TW'}, 
    CHN: { fillKey: 'TW'}, 
    AUS: { fillKey: 'TW'},
    ECU: { fillKey: 'TW'},
    SGP: { fillKey: 'TW'},
    TUR: { fillKey: 'TW'}
  }
  });
    
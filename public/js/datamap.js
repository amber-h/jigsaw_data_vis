var map = new Datamap({
  element: document.getElementById('map-container'),
  fills: { 
    TW: 'rgba(3,151,179,0.72)', 
    PINK: 'rgba(206,2,55,0.55)',
    defaultFill: 'rgba(2,206,116,0.6)'
  },
  geographyConfig: {
    highlightBorderColor: '#bada55',
    popupTemplate: function(geography, data) {
      return '<div class="hoverinfo">' + geography.properties.name + ' Female Devs: ' +  data.female_devs + '%' 
  }},
  data: {
    USA: { fillKey: 'TW', female_devs: 23},
    CAN: { fillKey: 'TW', female_devs: 17},
    BRA: { fillKey: 'TW', female_devs: 10},
    GBR: { fillKey: 'TW', female_devs: 12},
    DEU: { fillKey: 'TW', female_devs: 40}, 
    ZAF: { fillKey: 'TW', female_devs: 12}, 
    IND: { fillKey: 'TW', female_devs: 40}, 
    CHN: { fillKey: 'TW', female_devs: 24}, 
    AUS: { fillKey: 'TW', female_devs: 14},
    ECU: { fillKey: 'TW', female_devs: 12},
    SGP: { fillKey: 'TW', female_devs: 9},
    TUR: { fillKey: 'TW', female_devs: 32}
  }
  });

    
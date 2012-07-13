/* improved template.js for your health
 */

/* Rows example
 * var row = {
 *  event_type : {
 *    type : "begin", 
 *    element: '<input type="hidden" name="duty_type1"' + 
 *                'id="duty_type1"' + 
 *                'value="normal_service">' + 
 *                '<input type="hidden" name="event_type1"' + 
 *                'id="event_type1"' + 
 *                'value="begin_normal_service">';
 *  },  
 *  duty_type : "normal_service" 
 *  service_type : "covered", 
 *  location : "14201", 
 *  date : "2012-07-10", 
 *  time : "08:00",
 *  legend : "T1"
 *  errors : list of errors 
 * }
*/ 

/*
 * $.each(buttons, function( propertyName, button ) { 
 *  $('<button>', { 
 *    html: button.label,
 *    id: propertyName
 *  })
 *  .bind('click', button.action)
 *  .appendTo( '
 */

function assertEquals(a, b) { 
  return a == b; 
}

var State = function(opts) { 
  for(var attr in opts ) { 
    if(opts.hasOwnProperty(attr)) { 
      this[attr] = opts[attr]; 
    }
  }
}; 
State.prototype.trouble_ticket = function() {}
State.prototype.normal_service = function() {}

var event_state {
  duty : "normal_service", 
  service : { 
              current : 0, 
              0 : "Covered Service",  
              1 : "Non-Covered Service"
            }, 
  begin : new State({
    trouble_ticket : function() {
      $("#off_duty_cell").hide(); 
      $("#normal_service_call").show(); 
      var hidden_field = "Begin Trouble Call" + getHiddenField("event_type", "begin_trouble_ticket"); 
      this.currentDuty = "trouble_ticket"; 

      return hidden_field; 
    },
    normal_service : function() {
      $("#off_duty_cell").show(); 
      $("#normal_service_call").hide(); 
      var hidden_field = "Begin Normal Service" + getHiddenField("event_type", "begin_normal_service"); 
      this.currentDuty = "normal_service"; 

      return hidden_field; 
    }
  }),
  // Seems to not rely on duty type? 
  end : new State({
    trouble_ticket : function() {

      },
    normal_service : function() {}
  }),
  switch_out_of_trouble : new State({
    trouble_ticket : function() {},
    normal_service : function() {}
  }),
  switch_ : new State({
    trouble_ticket : function() {},
    normal_service : function() {}
  }),
  interrupted : new State({
    trouble_ticket : function() {},
    normal_service : function() {}
  }),
}

var table = { 
  name   : "scheduleTable", 
  rows   : [], 
  addRow : function(duty_type, event_type) {
             var _row = rows.length + 1; 
             this.rows.push(getRow(duty_type,                                
                                    getEventTypeCell(_row, event_state[event_type][duty_type]),
                                    getServiceTypeCell(_row, event_state[event_type][duty_type]),
                                    getLocationCell(_row, event_state[event_type][duty_type]),
                                    getDateCell(_row, event_state[event_type][duty_type]),
                                    getTimeCell(_row, event_state[event_type][duty_type]),
                                    getLegendCell(_row, event_state[event_type][duty_type])
                                    ); 
                            ); 
           }
} 



var currentRow = table.rows.length + 1; 

function getRow(duty_type, event_type,
                service_type, loc, 
                dt, time, legend) { 
  var row = {}; 

  row.duty_type     = duty_type;  
  row.event_type    = event_type;  
  row.service_type  = service_type;  
  row.location      = loc; 
  row.date          = dt; 
  row.time          = time;  
  row.legend        = legend;  
  
  return row; 
}

function getHiddenField(row, type, value) { 
  var el = createElement('input'); 
  el.type = 'hidden'; 
  el.name = type + row; 
  el.id = el.name; 
  el.value = value; 
  return el; 
}


function getEventTypeCell(row, duty_type, event_type) { 
  event_obj = {}; 
  event.type = event_type; 
 
  hidden_field = getHiddenField(row, "duty_type", duty_type); 
  // add other properties here, and attach to another node 
}

 
function getServiceTypeCell(row, duty_type, event_type) { 
}

function getLocationCell(row, duty_type, event_type) { 
} 

function getDateCell(row, duty_type, event_type) { 
}
 
function getTimeCell(row, duty_type, event_type) { 
} 

function getLegendCell(row, duty_type, event_type) { 
} 



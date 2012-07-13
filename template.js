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

function assertEquals(a, b) { 
  return a == b; 
}

var table = { 
  name   : "scheduleTable", 
  rows   : [], 
} 

var currentRow = table.rows.length + 1; 

function addRow(row, duty_type, event_type) {
  table.rows.push(getRow(duty_type;                                
                         getEventTypeCell(i, duty_type, event_type),
                         getServiceTypeCell(i, duty_type, event_type),
                         getLocationCell(i, duty_type, event_type),
                         getDateCell(i, duty_type, event_type),
                         getTimeCell(i, duty_type, event_type),
                         getLegendCell(i, duty_type, event_type)
                         ); 
                 ); 
}

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



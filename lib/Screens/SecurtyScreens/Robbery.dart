import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Security_robbery extends StatelessWidget {
  @override
  Widget  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){Navigator.pop(context);}
            ),
            
      ),
        
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(  
          
                
            children: [
                 
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(33, 1, 1, 1),
                
              ),
             
             
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'search for report ',
                     style:TextStyle(
                      
                     ),
                    
                    ),
                    
                  
                ],
              ),
            ),
          
          
            Expanded(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                  
                  
                
                child: Row(
                  
                        children: [
                          Expanded(
                            
                              child: ListView.builder(itemCount: 12,scrollDirection: Axis.vertical,
                              itemExtent:200,
                              
                                itemBuilder:(context, index) => Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      
                                      color: Colors.grey,
                                    
                                    ),
                                    
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('                                          Report ID : ',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ), 
                                        ),
                                          Text('Robbery in section 3',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        
                                        ),
                                       
                                        
                                        SizedBox(
                                          height: 20,
                                          width: 60,
                                        ),
                                       
                                      ],
                                      
                                    ),
                                    
                                  ),
                                ),
                                
                                
                              ),
                            
                          ),
                                SizedBox(
                              width: 15,
              
                              ), 
                  
                          ],
                    ),
                  ),
                ),
          
          
          
          
          
          
              
              
             
          
          
             Expanded(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
               
               
                
                child: Row(
                  
                        children: [
                          Expanded(
                            
                              child: ListView.builder(itemCount: 12,scrollDirection: Axis.horizontal,
                              itemExtent: 200,
                              
                                itemBuilder:(context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey,
                                    ),
                                    
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('username',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        
                                        ),
                                        Icon(
                                          Icons.account_box,
                                          size: 70,
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 60,
                                        ),
                                        Text('Available or busy ',
                                        style: TextStyle(
                                          fontSize:25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        Text(
                                          'Report ID',
                                          style: TextStyle(
                                              fontSize: 20,
                                              
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            
                          ),
                           SizedBox(
              width: 15,
            ),
                  
                        ],
                 ),
              ),
            ),
              
            ],
          ),
        ),      
      );
  }
}
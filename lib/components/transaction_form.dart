import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String,double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm(){
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if(title.isEmpty || value <= 0){
      return;
    }

    onSubmit(title,value);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget> [ 
                    TextField(
                      onSubmitted: (_) => _submitForm(),
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Titulo', 
                      ),
                    ),
                    TextField(
                      onSubmitted: (_) => _submitForm(),
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Valor (R\$)', 
                      ),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget> [
                        ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: Text('Nova transação'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                          ),
                      ],
                    )
                ]),
              ),
            );
  }
}
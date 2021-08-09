import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Razor_Pay')),
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Image.network('https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcROODDu_-EJo94_cAAz3kbYdAcyZfRXM2m02M--QQTE3LnMD0ZGsUOkm-N5Wamgo5M8ke_QVCJrIAvBm3kZr6Q1YNAZpwZyFg&usqp=CAc')
                ),
                SizedBox(height: 7,),
              Text('Asus Zenfone Max Pro M1', style: TextStyle(fontSize: 20.0,color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7,),
              Text('Best Budget Gaming Mobile', style: TextStyle(fontSize: 20.0,color: Colors.black, fontWeight: FontWeight.bold),),
              SizedBox(height: 7,),
              ElevatedButton.icon(
                onPressed: () {
                  openCheckout();
                },
                icon: Icon(Icons.payment),
                label: Text("Buy Now"),
              ),
            ],
          ),
      ),
      
      
    );
  }
  
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Do something when payment succeeds
}

  void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails
}

  void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet is selected
}

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

    void openCheckout() async {
    var options = {
      'key': 'rzp_test_p0Ff6wUNy2N6T4',
      'amount': 7999.0,
      'name': 'Asus Zenfone Max Pro M1',
      'description': 'Gaming Mobile',
      'prefill': {'contact': '9876543210',
      'email': 'test@pay.com'
      },
    };
_razorpay.open(options);
  }
}

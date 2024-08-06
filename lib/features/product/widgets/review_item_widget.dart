part of '../product_detail_screen.dart';

class _ReviewItemWidget extends StatelessWidget with UiMixins {
  const _ReviewItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                  'assets/images/boy.png',
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguyễn Văn A',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  showStar(number: 5, size: 16)
                ],
              )
            ],
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus leo nunc, vehicula a pellentesque nec, consequat eget leo. Mauris quis erat elit. Suspendisse in pellentesque magna. Vivamus a ex ullamcorper, congue augue at, condimentum dui. Donec sodales, ex eu faucibus tempor, nisi lectus mattis magna, sit amet commodo neque est eleifend augue. Suspendisse facilisis imperdiet velit, ac commodo urna interdum ac. Ut at consectetur orci. Duis lobortis convallis feugiat. Nunc sed dignissim arcu. Nulla facilisi. In tincidunt mattis bibendum. Praesent nisl justo, facilisis at tempus ut, volutpat a velit. Sed nisl elit, consectetur id auctor vel, tincidunt at odio. Morbi pellentesque, risus in vestibulum pulvinar, massa sapien pellentesque sapien, ac dapibus leo est eget mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. ',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                color: Colors.grey.shade700),
            maxLines: 5,
          ),
          _AssetsReviewWidget(),
          SizedBox(
            height: 5,
          ),
          Text(
            '25-07-2024',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

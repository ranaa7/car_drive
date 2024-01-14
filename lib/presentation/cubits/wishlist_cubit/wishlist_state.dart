abstract class WishlistState{}
class InitState extends WishlistState{}
class AddProductToWishlistLoadingState extends WishlistState{}
class AddProductToWishlistSuccessState extends WishlistState{}
class AddProductToWishlistErrorState extends WishlistState{}
class CheckIfProductInWishlistLoadingState extends WishlistState{}
class CheckIfProductInWishlistSuccessState extends WishlistState{}
class CheckIfProductInWishlistErrorState extends WishlistState{}

class GetWishlistLoadingState extends WishlistState{}
class GetWishlistSuccessState extends WishlistState{}
class GetWishlistErrorState extends WishlistState{}

class RemoveWishlistLoadingState extends WishlistState{}
class RemoveWishlistSuccessState extends WishlistState{}
class RemoveWishlistErrorState extends WishlistState{}

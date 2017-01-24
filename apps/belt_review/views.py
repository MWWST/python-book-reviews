from django.shortcuts import render, HttpResponse, redirect
from .models import User, Book, Author, Review
from django.contrib import messages
# Create your views here.
def index(request):
	return render(request,'belt_review/index.html')

def books(request):
	#last theer book reviews
	# all books with reviews
	lastThreeReviews = Review.objects.all().order_by('-id')[:3:1]
	booksWithReviews = Review.objects.all().order_by('-id')
	context = {
		'reviews':lastThreeReviews,
		'booksWithReviews':booksWithReviews
	}
	return render(request,'belt_review/all_reviews.html',context)

def oneBook(request,bookid):
	b = Book.objects.get(id=bookid)
	a = Author.objects.get(books=b)
	print(a.author_name)
	context = {
		'book': Book.objects.get(id=bookid),
		'reviews': Review.objects.filter(review_for_book_id=bookid),
		'author':a
	}
	return render(request,'belt_review/book_detail.html',context)

def addBook(request):
	print(request.session['user_id'])
	context = {
		'authors': Author.objects.all()
	}
	return render(request,'belt_review/add_books.html',context)

def createBook(request):
	print(request.POST['book_title'])
	print(request.session['user_id'])
	#1. create the book object b1 and save it
	b1 = Book(title=request.POST['book_title'],book_by_user=User.userManager.get(id=request.session['user_id']))
	b1.save()

	#2. if there is a new author object submitted, create it and save it 
	## a1

	if request.POST['existing_author'] == '0':
		a1 = Author(author_name=request.POST['new_author'], author_by_user=User.userManager.get(id=request.session['user_id']))
		a1.save()
	#3. if there is an exsting author object submitted, get it
	
	#4. if there is a review submitted we should also create it
 	 #review_by_user is actually the book id
		
	#. a1.books.add(b1)
	else:
		a1 = Author.objects.get(id=request.POST['existing_author'])

	r1 = Review(review_text=request.POST['review'],review_rating=request.POST['rating'],review_by=User.userManager.get(id=request.session['user_id']),review_for_book_id=b1.id)
	r1.save()


	try:
		a1.books.add(b1)
		messages.success(request, "Book Successfully Added!")
		return redirect('/books/'+str(b1.id))
	except Exception as e:
		messages.warning(request, e)
		return redirect('/books/add')

def createReview(request,bookid):
	r1 = Review(review_text=request.POST['review'],review_rating=request.POST['rating'],review_by=User.userManager.get(id=request.session['user_id']),review_for_book_id=bookid)
	try:
		r1.save()
		messages.success(request, "Review Successfully Added!")
		return redirect('/books/'+bookid)
	except Exception as e:
		messages.warning(request, e)
		return redirect('/books/'+bookid)

def destroyReview(request,reviewid):
	try:
		r1 = Review.objects.filter(id=reviewid)
	except Exception as e:
		messages.warning(request, e)
		return redirect('/books/'+str(review_for_book.id))

	if request.session['user_id'] != r1[0].review_by.id:
			messages.warning(request, "HEY! Thats not your review to delete!")
			return redirect('/books/'+str(r1[0].review_for_book.id))
	else:
		try:
			Review.objects.filter(id=reviewid).delete()
			messages.success(request, "Review Successfully Deleted!")
			return redirect('/books')
		except Exception as e:
			messages.warning(request, e)
			return redirect('/books')

def user (request,userid):
	user = User.userManager.filter(id=userid)
	print (user[0].first_name)
	booksWithReviews = Review.objects.filter(review_by__id=user[0].id).order_by('-id')
	print(booksWithReviews[0].review_for_book.title)
	context = {
		'user': user[0],
		'booksWithReviews': booksWithReviews,
		'count': len(booksWithReviews)
	}
	return render(request,'belt_review/user_profile.html',context);
def register(request):

	# step one lets try to validate that email and register the user
	if User.userManager.filter(email=request.POST['email']):
		messages.warning(request, "Oops, looks like you are already registered, try logging in!")
		return redirect('/')
	try:
		User.userManager.register(request.POST['email'],request.POST['password'],request.POST['first_name'],request.POST['last_name'])
		try:
			success = User.userManager.login(request.POST['email'],request.POST['password'])
			if success == False:
				messages.warning(request,"Incorrect Login")
				return redirect('/')
			else:
				user = User.userManager.filter(email=request.POST['email'])
				request.session['user_id'] = user[0].id
				request.session['first_name'] = user[0].first_name
				request.session['loggedIn'] = True
				messages.success(request, "User Registered and Successfully Logged In")
				return redirect('/books')
		except Exception as e:
			messages.warning(request, e)
			return redirect('/')
	except Exception as e:
		print e
		if e == "password error":
			messages.warning(request,'Password must be at least 8 characters long')
		else:
			messages.warning(request, e)
		return redirect('/')


def login(request):
	try:
		success = User.userManager.login(request.POST['email'],request.POST['password'])
		if success == False:
			messages.warning(request,"Incorrect Login")
			return redirect('/')
		else:
			user = User.userManager.filter(email=request.POST['email'])
			request.session['user_id'] = user[0].id
			request.session['first_name'] = user[0].first_name
			request.session['loggedIn'] = True
			messages.success(request, "User Successfully Logged In")
			return redirect('/books')
	except Exception as e:
		messages.warning(request, e)
		return redirect('/')

def success(request):
	return render(request,'belt_review/books.html')

def logout(request):
	del request.session['loggedIn']
	del request.session['first_name']
	del request.session['user_id']
	messages.success(request, "User Successfully Logged Out")
	return redirect('/')
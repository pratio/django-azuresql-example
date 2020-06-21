from django.http import HttpResponse


# def index(request):
#     return HttpResponse("Hello, world. You're at the polls index.")

from django.shortcuts import render
from django_tables2 import SingleTableView
from .models import Question
from .tables import QuestionTable


class QuestionListView(SingleTableView):
    model = Question
    table_class = QuestionTable
    template_name = 'polls/index.html'


# def index(request):
#     products = [
#         {'title': 'PlayStation', 'price': 300, 'image': 'https://cdn.auth0.com/blog/django-webapp/playstation.png'},
#         {'title': 'iPhone', 'price': 900, 'image': 'https://cdn.auth0.com/blog/django-webapp/iphone.png'},
#         {'title': 'Yummy Pizza', 'price': 10, 'image': 'https://cdn.auth0.com/blog/django-webapp/pizza.png'},
#     ]
#
#     context = {
#         'products': products,
#     }
#     return render(request, 'polls/index.html', context)


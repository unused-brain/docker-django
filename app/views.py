from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(["GET"])
def index(request):
    return Response("Welcome to my awesome django project!!!")

@api_view(["GET"])
def get_name(request, name):
    return Response(f"Hi {name}. How are you!")